update_completions:
	zsh -c "env COMMANDLINE="${words[1,$CURRENT]}" _PIPENV_COMPLETE=complete-zsh  pipenv > _pipenv"
