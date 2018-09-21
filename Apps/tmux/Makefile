PWD = $(shell pwd)

config:

	$(LN) ${PWD}/tmux.conf.local ${HOME}/.tmux.conf.local

install:

install_arch:
	$(SUDO) pacman -S --noconfirm tmux

clean:
	$(RM) ${HOME}/.tmux.conf
	$(RM) ${HOME}/.tmux.conf.local
	$(RM) -r ${HOME}/.tmux

.PHONY: clean

