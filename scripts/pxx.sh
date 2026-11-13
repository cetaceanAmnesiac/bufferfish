#!/bin/sh

case "${PX_BF:-npm}" in
    bun) exec bunx "$@" ;;
    npm) exec npx "$@" ;;
    *) printf 'Unsupported PX_BF: %s\n' "$PX_BF" >&2; exit 2 ;;
esac