gwpath() {
   git worktree list | rg "$1" | awk '{print $1}'
}

gwcd() {
   cd "$(gwpath $1)"
}
