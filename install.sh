#!/usr/bin/env bash

BLUE='\033[0;34m'
NC='\033[0m'

ORGANIZATION="nsymx"
PROJECT_NAME="hyprsp4ce"
GITHUB_REPO="${ORGANIZATION}/${PROJECT_NAME}"

logger_info() {
	echo -e "${BLUE}[INFO]${NC} $1" >&2
}

clear || exit

echo -e "${BLUE}"
cat <<"EOF"
|_       ._   ._   _  ._   |_|_   _   _
| |  \/  |_)  |   _>  |_)    |   (_  (/_
     /   |            |

> Enjoy your stay.
EOF
echo -e "${NC}"

logger_info "hyprsp4ce installer initialized"
logger_info "github.com/${GITHUB_REPO}"
