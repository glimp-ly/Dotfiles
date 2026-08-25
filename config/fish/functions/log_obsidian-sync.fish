function log_obsidian-sync --wraps='watch -n 1 tail -n 20 ~/.obsidian-sync.log' --description 'alias log_obsidian-sync=watch -n 1 tail -n 20 ~/.obsidian-sync.log'
    watch -n 1 tail -n 20 ~/.obsidian-sync.log $argv
end
