#!/usr/bin/env bash

# Todos:
# 	- Add logging
#      - Add country selection

if ! command -v "reflector" >/dev/null 2>&1; then
	sudo pacman -Syu reflector
else
	sudo pacman -Syu
fi

sudo reflector -c Canada \
	--protocol https \
	--latest 20 \
	--age 6 \
	--sort rate \
	--save /etc/pacman.d/mirrorlist
