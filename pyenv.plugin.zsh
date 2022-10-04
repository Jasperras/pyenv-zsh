GITHUB="https://github.com"

[[ -z "${PYENV_ROOT}" ]] && export PYENV_ROOT="${HOME}/.pyenv"

_zsh_pyenv_install() {
    echo "Installing pyenv..."
    git clone "${GITHUB}/pyenv/pyenv.git" "${PYENV_ROOT}"
}

_zsh_pyenv_load() {
    export PATH="${PYENV_ROOT}/bin:${PATH}"
    eval "$(pyenv init -)"
}

# First check if installed, if not, install.
[[ ! -d "${PYENV_ROOT}" ]] && _zsh_pyenv_install

# Then always check again to load, otherwise it may not load upon first install.
[[ -d "${PYENV_ROOT}" ]] && _zsh_pyenv_load

