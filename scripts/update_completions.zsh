local comp_str1 comp_str2
# comp_str1="$(env COMMANDLINE="pipenv" _PIPENV_COMPLETE=complete-zsh  pipenv)"
# comp_str1="${comp_str1:0:-3}"
# comp_str2="$(env COMMANDLINE="pipenv -" _PIPENV_COMPLETE=complete-zsh  pipenv))"
# echo $comp_str2

echo $(env COMMANDLINE="pipenv -" _PIPENV_COMPLETE=complete-zsh  pipenv)
echo $(env COMMANDLINE="pipenv install -" _PIPENV_COMPLETE=complete-zsh  pipenv)

# env COMMANDLINE="pipenv" _PIPENV_COMPLETE=complete-zsh  pipenv > _pipenv
# env COMMANDLINE="pipenv -" _PIPENV_COMPLETE=complete-zsh  pipenv >> _pipenv

# comp_str2="${comp_str2:18:-1}"
# echo "${comp_str1}\n${comp_str2}" > _pipenv
# env COMMANDLINE="pipenv -" _PIPENV_COMPLETE=complete-zsh  pipenv >> _pipenv