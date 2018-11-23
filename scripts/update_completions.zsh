echo "#compdef pipenv\n" > _pipenv

# local comp_str1 comp_str2
# comp_str1="$(env COMMANDLINE="pipenv" _PIPENV_COMPLETE=complete-zsh  pipenv)"
# comp_str1="${comp_str1:0:-3}"
# comp_str2="$(env COMMANDLINE="pipenv -" _PIPENV_COMPLETE=complete-zsh  pipenv))"
# comp_str2="${comp_str2:18:-1}"
# echo "${comp_str1}\n${comp_str2}" >> _pipenv

# echo $(env COMMANDLINE="pipenv -" _PIPENV_COMPLETE=complete-zsh  pipenv)
# echo $(env COMMANDLINE="pipenv install -" _PIPENV_COMPLETE=complete-zsh  pipenv)

# env COMMANDLINE="pipenv" _PIPENV_COMPLETE=complete-zsh  pipenv > _pipenv
# env COMMANDLINE="pipenv -" _PIPENV_COMPLETE=complete-zsh  pipenv >> _pipenv

# comp_str2="${comp_str2:18:-1}"
# echo "${comp_str1}\n${comp_str2}" > _pipenv
# env COMMANDLINE="pipenv -" _PIPENV_COMPLETE=complete-zsh  pipenv >> _pipenv


echo "local -a commands=${$(env COMMANDLINE="pipenv" _PIPENV_COMPLETE=complete-zsh  pipenv):17:-2}" >> _pipenv
echo "" >> _pipenv
echo "_arguments -C \\
    '1:cmd:->cmds' \\
    '*:: :->args' \\" >> _pipenv
echo "" >> _pipenv
echo "case \"\$state\" in
    (cmds)
        _describe -t commands 'commands' commands
        ;;
    (*)
        _pipenv_command_arguments
        ;;
esac" >> _pipenv


