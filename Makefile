all: install nvim tmux

PACKER_PATH=~/.local/share/nvim/site/pack/packer/start

install:
	chmod u+x install.sh
	./install.sh

nvim:
	rm -rf nvim/plugin || exit 0
	rm -rf ~/.local/share/nvim || exit 0
	rm -rf ~/.config/nvim || exit 0
	rm -rf $(PACKER_PATH) || exit 0
	mkdir -p ~/.config
	mkdir -p $(PACKER_PATH)
	git clone --depth 1 https://github.com/wbthomason/packer.nvim $(PACKER_PATH)/packer.nvim
	ln -snf $(PWD)/nvim ~/.config/nvim

tmux:
	rm -rf ~/.tmux.conf || exit 0
	ln -sf $(PWD)/.tmux.conf ~/.tmux.conf

.PHONY: nvim tmux 
