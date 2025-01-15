setup: link
	cp inventory_example inventory.ini
	cp ./alacritty/alacritty.toml ~/.config/alacritty/
	# Install catppuccin theme for alacritty
	curl -LO --output-dir ~/.config/alacritty https://github.com/catppuccin/alacritty/raw/main/catppuccin-mocha.toml

link:
	ln -sf ./nvim/ ~/.config/nvim
	ln -sf ./hypr/ ~/.config/hypr
	ln -sf ./waybar/ ~/.config/waybar
	ln -sf ./swaync/ ~/.config/swaync

ensure_folders:
	mkdir -p ~/.config/alacritty/

ping:
	ansible all -i inventory.ini -m ping

run: packages configs

packages:
	ansible-playbook playbooks/packages.yml -i inventory.ini

configs:
	ansible-playbook playbooks/configs.yml -i inventory.ini

tools: ruby docker zk

zk:
	ansible-playbook playbooks/tools/zk.yml -i inventory.ini
ruby:
	ansible-playbook playbooks/tools/ruby.yml -i inventory.ini
docker:
	ansible-playbook playbooks/tools/docker.yml -i inventory.ini
