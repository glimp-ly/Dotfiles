#!/bin/bash

# Variables
LOCAL_DIR="$HOME/obsidianMe"
REMOTE="obsidian-remote:obsidianMe"
LOCK_FILE="/tmp/obsidian-sync.lock"
PID_FILE="/tmp/obsidian-watch.pid"
LOG="$HOME/.obsidian-sync.log"

# Comprobación de instancia existente
if [ -f "$PID_FILE" ] && kill -0 "$(cat "$PID_FILE")" 2>/dev/null; then
    echo "[$(date +%F\ %T)] 🛑 Watcher ya está corriendo (PID: $(cat "$PID_FILE")). Abortando." >> "$LOG"
    exit 0
fi

# Guardar PID actual y preparar limpieza al salir
echo $$ > "$PID_FILE"
trap "rm -f $PID_FILE $LOCK_FILE" EXIT

# Verificar que inotifywait esté instalado
if ! command -v inotifywait &> /dev/null; then
    echo "[$(date +%F\ %T)] ❌ inotifywait no está instalado. Abortando." >> "$LOG"
    exit 1
fi

echo "[$(date +%F\ %T)] 🔄 Watcher iniciado (PID: $$)" >> "$LOG"

# Monitoreo y sincronización agrupada
while true; do
    # Esperar el primer evento
    inotifywait -r -e modify,create,delete,move "$LOCAL_DIR" >/dev/null 2>&1

    echo "[$(date +%F\ %T)] 📌 Evento detectado. Esperando 30s para estabilizar..." >> "$LOG"
    sleep 60

    # Verificar si otra sincronización está en curso
    if [ -f "$LOCK_FILE" ]; then
        echo "[$(date +%F\ %T)] ⏳ Otra sincronización en curso. Saltando..." >> "$LOG"
        continue
    fi

    touch "$LOCK_FILE"
    echo "[$(date +%F\ %T)] 🔼 Subiendo cambios LOCAL → REMOTO..." >> "$LOG"

    rclone sync "$LOCAL_DIR" "$REMOTE" --log-level INFO >> "$LOG" 2>&1
    RC=$?

    if [ $RC -ne 0 ]; then
        echo "[$(date +%F\ %T)] ❌ Error al sincronizar (Código: $RC)" >> "$LOG"
        notify-send "Obsidian Sync" "❌ Error al sincronizar con Drive. Revisa el log."
    else
        echo "[$(date +%F\ %T)] ✅ Sincronización completada" >> "$LOG"
    fi

    rm -f "$LOCK_FILE"
done
