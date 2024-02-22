function update --wraps='mprocs -c .config/mprocs/update.yaml' --description 'alias update mprocs -c .config/mprocs/update.yaml'
  mprocs -c ~/.config/mprocs/update.yaml $argv
        
end
