#!/bin/bash
set -euxo pipefail

printf '🚀 Setting up Neovim plugins...\n'

# Function to check command success
check_success() {
    if [ $? -eq 0 ]; then
        printf '✅ %s\n' "$1"
    else
        printf '❌ %s failed!\n' "$1"
        exit 1
    fi
}

# Install vim-plug
if [ ! -f ~/.local/share/nvim/site/autoload/plug.vim ]; then
    printf '📥 Installing vim-plug...\n'
    mkdir -vp -- ~/'.local/share/nvim/site/autoload/'
    wget -q --show-progress -O ~/.local/share/nvim/site/autoload/plug.vim \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    check_success "vim-plug installation"
fi

# Clean, install, and update plugins
printf '🔧 Setting up plugins...\n'
nvim --headless +PlugClean! +PlugInstall +PlugUpdate +qa
check_success 'Plugin installation'

# Optional: Install coc.nvim extensions
printf '📦 Setting up coc.nvim extensions...\n'
nvim --headless '+CocInstall -sync coc-json coc-tsserver' +qa 2>/dev/null || true

printf '🎉 Neovim setup complete! All plugins installed.\n'
