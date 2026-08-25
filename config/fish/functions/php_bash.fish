function php_bash --wraps='docker exec -it dev_server_php bash' --description 'alias php_bash=docker exec -it dev_server_php bash'
    docker exec -it dev_server_php bash $argv
end
