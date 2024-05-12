setup:
	cp inventory_example inventory.ini

ping:
	ansible all -i inventory.ini -m ping

run: packages configs

packages:
	ansible-playbook playbooks/packages.yml -i inventory.ini

configs:
	ansible-playbook playbooks/configs.yml -i inventory.ini

