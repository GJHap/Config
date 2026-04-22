gwpath() {
   local result=$(git worktree list | rg "$1" | awk '{print $1}')
   if [[ -z "$result" ]]; then
      echo "No worktree matching '$1'" >&2
      return 1
   fi

   echo "$result"
}

gwcd() {
   local result=$(gwpath "$1")
   if [[ -z "$result" ]]; then
      return 1
   fi

   cd "$result"
}
