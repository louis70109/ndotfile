sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# 安装 zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# 安装 zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# 安装 fast-syntax-highlighting
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting

# 安装 zsh-fzf-history-search
git clone https://github.com/joshskidmore/zsh-fzf-history-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-fzf-history-search

# 安装 powerlevel10k 主题
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

# 安装 direnv
if ! command -v direnv &> /dev/null; then
  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    sudo apt install direnv -y || sudo dnf install direnv -y
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    brew install direnv
  fi
fi

# 安装 fzf
if ! command -v fzf &> /dev/null; then
  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    sudo apt install fzf -y || sudo dnf install fzf -y
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    brew install fzf
  fi
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install --all
fi

