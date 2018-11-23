function pipenv_chpwd() {

    # Check if Pipfile exists in pwd or either the parent dir or the parents parent dir
    if [[ ! -e "$PWD/Pipfile" ]]; then
        if [[ ! -e "$PWD/../Pipfile" ]]; then
            if [[ ! -e "$PWD/../../Pipfile" ]]; then
                return
            fi
        fi
    fi
    
    if [[ ! "$PIPENV_ACTIVE" ]]; then
        if pipenv --venv >/dev/null 2>&1; then
            pipenv shell
        fi
    fi
}

chpwd_functions+=(pipenv_chpwd)