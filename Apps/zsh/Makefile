# .ONESHELL:

PWD = $(shell pwd)

define cfg_zsh
# Install prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "$${ZDOTDIR:-$$HOME}/.zprezto"
setopt EXTENDED_GLOB ;\
for rcfile in "$${ZDOTDIR:-$$HOME}"/.zprezto/runcoms/^(README.md|zshrc|zpreztorc)(.N); do \
  ln -s "$$rcfile" "$${ZDOTDIR:-$$HOME}/.$${rcfile:t}" ;\
done

curl https://gist.githubusercontent.com/wikimatze/4c2fbaf8ebe1e8ce0c1f/raw/ed34a873ab0be5dc687b8047eb1912afabaa2014/prompt_wikimatze_setup \
    -o "$${ZDOTDIR:-$$HOME}/.zprezto/modules/prompt/functions/prompt_wikimatze_setup"
# chsh -s /bin/zsh
endef

config: SHELL := $(shell which zsh)
config:
#	$(cfg_zsh)

	$(LN) ${PWD}/zshrc ${HOME}/.zshrc
	$(LN) ${PWD}/zpreztorc ${HOME}/.zpreztorc
	@-$(shell chsh -s /bin/zsh)

install:

install_arch:
	@$(shell sudo pacman -S zsh --noconfirm)

clean:
	$(RM) ${HOME}/.zshrc
	$(RM) ${HOME}/.zshenv
	$(RM) ${HOME}/.zpreztorc
	$(RM) -r ${HOME}/.zprezto
	-$(shell chsh -s `which bash`)


.PHONY: clean

