setup:
	cp inventory_example inventory.ini
	mkdir -p ~/.config/alacritty/
	cp ./alacritty/alacritty.toml ~/.config/alacritty/
	# Install catppuccin theme for alacritty
	curl -LO --output-dir ~/.config/alacritty https://github.com/catppuccin/alacritty/raw/main/catppuccin-mocha.toml

ping:
	ansible all -i inventory.ini -m ping

run: packages configs

packages:
	ansible-playbook playbooks/packages.yml -i inventory.ini

configs:
	ansible-playbook playbooks/configs.yml -i inventory.ini

