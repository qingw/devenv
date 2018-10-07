PWD = $(shell pwd)

config:
	git clone https://github.com/gpakosz/.tmux.git ${HOME}/.tmux
	$(LN) ${HOME}/.tmux/.tmux.conf ${HOME}/.tmux.conf
	$(LN) ${PWD}/tmux.conf.local ${HOME}/.tmux.conf.local

install:

install_arch:
	$(SUDO) pacman -S --noconfirm tmux

install_mac:
	brew install tmux

clean:
	$(RM) ${HOME}/.tmux.conf
	$(RM) ${HOME}/.tmux.conf.local
	$(RM) -r ${HOME}/.tmux

.PHONY: clean

