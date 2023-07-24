all: install nvim tmux

PACKER_PATH=~/.local/share/nvim/site/pack/packer/start

install:
	chmod u+x install.sh
	./install.sh

nvim:
	mkdir -p ~/.config
	ln -snf $(PWD)/nvim ~/.config/nvim

tmux:
	rm -rf ~/.tmux.conf || exit 0
	ln -sf $(PWD)/.tmux.conf ~/.tmux.conf

.PHONY: nvim tmux 
