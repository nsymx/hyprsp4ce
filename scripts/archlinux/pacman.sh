#!/usr/bin/env bash

BLUE='\033[0;34m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

PACMAN_CONF="/etc/pacman.conf"

logger_info() {
	echo -e "${BLUE}[INFO]${NC} $1" >&2
}

logger_success() {
	echo -e "${GREEN}[SUCCESS]${NC} $1" >&2
}

logger_warn() {
	echo -e "${YELLOW}[WARN]${NC} $1" >&2
}

logger_error() {
	echo -e "${RED}[ERR]${NC} $1" >&2
}

if [[ ! -f "${PACMAN_CONF}" ]]; then
	logger_error "Cannot locate pacman configuration file"
	exit 1
else
	logger_info "Configuring pacman.conf..."
	echo ""
fi

if grep -Fq "#ParallelDownloads" /etc/pacman.conf; then
	sudo sed -i 's/^#ParallelDownloads/ParallelDownloads/' /etc/pacman.conf
	logger_success "ParallelDownloads activated!"
else
	logger_warn "ParallelDownloads is already enabled..."
fi

if grep -Fxq "#Color" /etc/pacman.conf; then
	sudo sed -i 's/^#Color/Color/' /etc/pacman.conf
	logger_success "Colors activated!"
else
	logger_warn "Colors are already enabled..."
fi

if grep -Fxq "#VerbosePkgLists" /etc/pacman.conf; then
	sudo sed -i 's/^#VerbosePkgLists/VerbosePkgLists/' /etc/pacman.conf
	logger_success "VerbosePkgLists activated!"
else
	logger_warn "VerbosePkgLists is already enabled..."
fi

if grep -Fxq "ILoveCandy" /etc/pacman.conf; then
	logger_warn "ILoveCandy is already enabled..."
else
	sudo sed -i '/^ParallelDownloads = .*/a ILoveCandy' /etc/pacman.conf
	logger_success "ILoveCandy activated!"
fi
