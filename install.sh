brew install --cask iterm2
brew install tmux
#brew install exa
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
echo "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k/powerlevel10k.zsh-theme" >> ~/.zshrc
brew install --HEAD luajit
brew install --HEAD tree-sitter
brew install neovim
brew install stow
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
brew tap homebrew/cask-fonts
#brew install --cask homebrew/cask-fonts/font-0xproto-nerd-font
brew install lazygit
bew install zoxide 
brew install ripgrep
brew install --cask ghostty
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm/
stow --adopt . -t /Users/$USER
echo 'eval "$(zoxide init zsh)"' >> ~/.zshrc
tmux source-file ~/.tmux.conf 
