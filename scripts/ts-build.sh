#!/bin/sh
set -e
# Purposefully not using `set -o xtrace`, for friendlier output.


# Presentational variables and functions declaration.

BLUE="\033[0;34m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
RED="\033[0;31m"
NOCOLOR="\033[0m"
DIM="\033[2m"

blue() {
    printf "${BLUE}$1${NOCOLOR}"
}
green() {
    printf "${GREEN}$1${NOCOLOR}"
}
yellow() {
    printf "${YELLOW}$1${NOCOLOR}"
}
red() {
    printf "${RED}$1${NOCOLOR}"
}
dim() {
    printf "${DIM}$1${NOCOLOR}"
}


# Build function declaration.
build_node() {
    blue "[Node build] "
    echo "Adding ./dist/cjs/package.json"
    if ! [ -d ./dist/cjs ];
    then
        mkdir ./dist/cjs
    fi
    rm -f ./dist/cjs/package.json
    cat <<EOT >> ./dist/cjs/package.json
{
    "type": "commonjs"
}
EOT
    echo "> npm run build:node"
    printf "${BLUE}[Node build] Working...\n"

    cp dist/esm/*.map dist/cjs
    cp dist/esm/*.d.ts dist/cjs
    
    pwd
    npx babel --config-file ./.babelrc dist/esm --out-dir dist/cjs

    green "DONE"

    echo "\n";
}

build_esm() {
    blue "[ESM build] "
    echo "Adding ./dist/esm/package.json"
    if ! [ -d ./dist ];
    then
        mkdir dist
        mkdir ./dist/esm
    fi
    rm -f ./dist/esm/package.json
    cat <<EOT >> ./dist/esm/package.json
{
    "type": "module"
}
EOT
    echo "> npm run build:esm"
    printf "${BLUE}[ESM build] Working... "

    npm run build:esm
    green "DONE"

    echo "\n";
}

# Begin build process.
build_esm
build_node

