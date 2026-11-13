# Later...
# bun add -d prettier
# TODO: https://prettier.io/docs/precommit
# TODO: package.json script
# ---

# export D_BF="$(cd "$(dirname "${(%):-%x}")" && pwd)" # zsh
# export D_BF="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)" # bash

if [ -z "$D_BF" ]; then
    echo "D_BF is not set"
    return 1 2>/dev/null || exit 1
fi

alias .cd-bf="cd \$D_BF"
alias .code-bf="code \$D_BF/.vscode/bf.code-workspace"
alias .npm-bf="npm --prefix \$D_BF" # TODO: bun
alias .bf="px run test:static"

px() {
    case "${PX_BF:-npm}" in
        bun) bun "$@" ;;
        npm) npm "$@" ;;
        *) printf 'Unsupported PX_BF: %s\n' "$PX_BF" >&2; return 2 ;;
    esac
}

pxx() {
    case "${PX_BF:-npm}" in
        bun) bunx "$@" ;;
        npm) npx "$@" ;;
        *) printf 'Unsupported PX_BF: %s\n' "$PX_BF" >&2; return 2 ;;
    esac
}

return 0

# px() {
#     if [ -f .env ] && grep -q "PX_BF=bun" .env; then
#         bun "$@"
#     else
#         npm "$@"
#     fi
# }

# pxx() {
#     if [ -f .env ] && grep -q "PX_BF=bun" .env; then
#         bunx "$@"
#     else
#         npx "$@"
#     fi
# }
