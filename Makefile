TARGET ?= ~

.PHONY: stow dryrunn override

stow:
	stow git npm nvim pip tmux zsh --target $(TARGET)

dryrun:
	stow git npm nvim pip tmux zsh -n -v --target $(TARGET)

override:
	stow git npm nvim pip tmux zsh --target $(TARGET) --adopt
