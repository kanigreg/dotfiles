setup:
	cp inventory_example inventory.ini

ping:
	ansible all -i inventory.ini -m ping

apply:
	ansible-playbook playbook.yml -i inventory.ini

configure_neovim:
	mkdir -p ~/.config
	ln -snf $(PWD)/nvim ~/.config/nvim

configure_tmux:
	ln -snf $(PWD)/tmux/.tmux.conf ~/.tmux.conf

