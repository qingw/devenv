LNFLAGS = -sf

ifeq ($(OS),Window_NT)
	OSNAME := windows
else
	OSNAME := $(shell uname -s)
	ifeq ($(OSNAME),Linux)
		OSNAME := $(lsb_release -si)
	endif
endif

XDG_CONFIG_HOME ?= ${HOME}/.config

export LN = ln $(LNFLAGS)
export WGET = wget -Nqnv
export PWD = $(shell pwd)
export XDG_CONFIG_HOME := $(XDG_CONFIG_HOME)
export ROOT_DIR := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))


TARGETS ?= bin nvim bash zsh
LIGHT_JOB ?= bin nvim bash zsh
INSTALL_TARGETS := $(TARGETS:%=install_%)
CLEAN_TARGETS := $(TARGETS:%=clean_%)

help:
	@echo "Run \`make -n install\` and read the output carefully."
	@echo "If you're happy with what will happen, then run \`make install\`."

all: $(TARGETS)

$(TARGETS):
	@$(info start config $@ ...)
	@$(MAKE) -C Apps/$@

$(INSTALL_TARGETS):
	@$(info start install $@ ...)
	@$(MAKE) -C Apps/$(subst install_,,$@) install


$(CLEAN_TARGETS):
	@$(info start clean $@ ...)
	@$(MAKE) -C Apps/$(subst clean_,,$@) clean

doctor:

info:
	@echo "just show info"

init:

bootstrap:

quickstart:


test:
	@echo $(OSNAME)


.PHONY: $(TARGETS) $(INSTALL_TARGETS) all test
