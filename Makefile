setup:
	cp inventory_example inventory.ini
ping:
	ansible all -i inventory.ini -m ping

