TARGET ?= ~

.PHONY: stow dryrunn override

stow:
	stow git nvim tmux zsh --target $(TARGET)

dryrun:
	stow git nvim tmux zsh -n -v --target $(TARGET)

override:
	stow git nvim tmux zsh --target $(TARGET) --adopt
