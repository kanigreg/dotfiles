# Currently not used, because require replacement all configuration files
# Would be fine to use in start of initialization process
# Profit: all program config files under one directory

# XDG (https://wiki.archlinux.org/title/XDG_Base_Directory)

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"

