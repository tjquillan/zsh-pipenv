function pipenv_chpwd() {
    if pipenv --venv >/dev/null 2>&1; then
        pipenv shell
    fi
}

chpwd_functions+=(pipenv_chpwd)