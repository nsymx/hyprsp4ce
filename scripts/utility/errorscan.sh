#!/usr/bin/env bash

BLUE='\033[0;34m'
NC='\033[0m'

logger_info() {
	echo -e "${BLUE}[INFO]${NC} $1" >&2
}

clear || exit

echo -e "${BLUE}"
echo -e "====================="
echo -e "===== errorscan ====="
echo -e "====================="
echo -e "${NC}"

logger_info "Checking journal for warnings or errors:"
journalctl -p 3 -b --no-pager --no-hostname

echo ""

logger_info "Checking for failed systemd services:"
systemctl --failed --no-pager
