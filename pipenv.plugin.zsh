function _pipenv_chpwd() {
    SHOULD_CD=false

    # Check if Pipfile exists in pwd or either the parent dir or the parents parent dir
    if [[ ! -e "$PWD/Pipfile" ]]; then
        if [[ ! -e "$PWD/../Pipfile" ]]; then
            if [[ ! -e "$PWD/../../Pipfile" ]]; then
                return
            else
                SHOULD_CD=true
            fi
        else
            SHOULD_CD=true
        fi
    fi

    if [[ ! "$PIPENV_ACTIVE" ]]; then
        if pipenv --venv >/dev/null 2>&1; then
            if [[ $SHOULD_CD == true ]]; then
                pipenv shell "cd $PWD"
            else
                pipenv shell
            fi
        fi
    fi
}

# Only add this to the chpwd hooks if pipenv is installed.
# Additionally if installed run _pipenv_chpwd once to check if the starting
# directory is a pipenv environment.
# This means that the shell will likely need to be reloaded if pipenv is installed.
if command -v pipenv > /dev/null; then
    chpwd_functions+=(_pipenv_chpwd)
    _pipenv_chpwd
fi
