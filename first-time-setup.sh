#!/bin/bash

# version comaparison, allows leading v|V character
verlte() {
	printf '%s\n%s' "${1#[Vv]}" "${2#[Vv]}" | sort -C -V
}

if ! which nvim &>/dev/null || verlte $(nvim --version | head -n1 | cut -d" " -f2) 0.5; then
	echo "ERR: nvim version 0.5 or later not installed. Cannot continue."
	exit 1
fi

if ! which node &>/dev/null || verlte $(node --version) 12.10.0; then
	echo "ERR: node version 12.10 or later not installed. Some plugins will not work."
	echo"       Visit https://nodejs.org/en/download/"
	exit 1
fi

if ! which bat &>/dev/null; then
	echo "WARN: bat is needed for the full experience in fzf."
	echo"       Visit https://github.com/sharkdp/bat"
	exit 1
fi

if [[ ! -d ~/.local/share/nvim/site/pack/packer/start/packer.nvim ]]; then
	git clone --depth 1 https://github.com/wbthomason/packer.nvim\
		~/.local/share/nvim/site/pack/packer/start/packer.nvim
fi
