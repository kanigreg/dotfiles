# Dotfiles

Config files to set up my work environment.

## Requirements

- make
- [ansible](https://github.com/ansible/ansible)
- VPS with Ubuntu (tested on v22.04)
- [Alacritty](https://github.com/alacritty/alacritty)
- [Iosevka Nerd Font](https://github.com/be5invis/Iosevka)

## Setup

1. Configure host machine
```bash
make setup
```

2. Fill `inventry.ini`

3. Run ansible playbooks
```bash
make run
```

4. Configure ssh
```ssh-config
Host dev
  HostName [VPS IP Address]
  User [username]
  RequestTTY yes
  RemoteCommand tmux new -A -s [Tmux session name]

Host dev/bash
  HostName [VPS IP Address]
  User [username]
```

## Usage

In Alacritty:
```bash
ssh dev
```
