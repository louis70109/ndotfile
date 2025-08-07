
# Detect OS
UNAME_S := $(shell uname -s)

ifeq ($(UNAME_S),Darwin)
    SOUND_COMMAND := afplay /System/Library/Sounds/Glass.aiff
else
    SOUND_COMMAND := paplay /usr/share/sounds/freedesktop/stereo/complete.oga
endif

# Default target
all: sync

# Install all dotfiles (removed automatic installation)
sync:
	@echo "⚠️  Please specify which configuration to install:"
	@echo "  make sync-ghostty       - Install Ghostty configuration"
	@echo "  make sync-ghostty-linux - Install Ghostty Linux configuration"
	@echo "  make sync-neovim        - Install Neovim configuration"
	@echo "  make sync-zsh           - Install Zsh configuration"
	@echo "  make sync-claude        - Install Claude Code configuration"

# Install Zsh configuration
sync-zsh:
	@echo "🐚 Installing Zsh configuration..."

	[ -f ~/.zshrc ] || ln -s $(PWD)/zshrc ~/zsh/.zshrc
	[ -f ~/.p10k.zsh ] || ln -s $(PWD)/p10k.zsh ~/zsh/.p10k.zsh
	@echo "✅ Zsh configuration installed"

# Install Claude Code configuration
sync-claude:
	@echo "🤖 Installing Claude Code configuration..."
	mkdir -p ~/.claude
	@echo "  Generating settings.json for $(UNAME_S)..."
	@sed 's|__SOUND_COMMAND__|$(SOUND_COMMAND)|g' claude_settings.json.template > ~/.claude/settings.json
	[ -f ~/.claude/CLAUDE.md ] || ln -s $(PWD)/claude_md ~/.claude/CLAUDE.md
	[ -d ~/.claude/commands ] || ln -s $(PWD)/commands ~/.claude/commands
	[ -d ~/.claude/agents ] || ln -s $(PWD)/agents ~/.claude/agents
	@echo "✅ Claude Code configuration installed"