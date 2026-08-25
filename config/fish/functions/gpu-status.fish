function gpu-status --wraps='watch -n 1 nvidia-smi' --description 'alias gpu-status=watch -n 1 nvidia-smi'
    watch -n 1 nvidia-smi $argv
end
