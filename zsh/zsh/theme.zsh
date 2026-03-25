export CATPPUCCIN_FLAVOR_FILE="$HOME/.local/state/catppuccin-flavor"

get_catppuccin_flavor() {
    [[ -f "$CATPPUCCIN_FLAVOR_FILE" ]] && cat "$CATPPUCCIN_FLAVOR_FILE" || echo "mocha"
}

reload_apps() {
   tmux source-file ~/.config/tmux/tmux.conf 2>/dev/null
   pkill -USR1 nvim 2>/dev/null
}

toggle_theme() {
    mkdir -p "$(dirname "$CATPPUCCIN_FLAVOR_FILE")"
    if [[ ! -f "$CATPPUCCIN_FLAVOR_FILE" ]]; then
       echo "mocha" > "$CATPPUCCIN_FLAVOR_FILE"
    fi

    local target="mocha"
    [[ "$(get_catppuccin_flavor)" == "mocha" ]] && target="latte"

    echo "$target" > "$CATPPUCCIN_FLAVOR_FILE"

    reload_apps
}

_load_catppuccin() {
  local flavors=("latte" "mocha")
  local cache_dir="${XDG_CACHE_HOME:-$HOME/.cache}/catppuccin"
  local json_file="$cache_dir/palette.json"
  local url="https://raw.githubusercontent.com/catppuccin/palette/main/palette.json"

  mkdir -p "$cache_dir"

  [[ -f "$json_file" ]] || curl -s "$url" -o "$json_file"

  if [[ -f "$json_file" ]] && command -v jq &> /dev/null; then
     for flavor in $flavors; do
        local color_data=$(jq -r ".\"$flavor\".colors | to_entries[] | \"\(.key|ascii_upcase)=\(.value.hex)\"" "$json_file")
        while read -r line; do
           export "CATPPUCCIN_${(U)flavor}_${line}"
        done <<< "$color_data"
     done
  fi
}

_load_catppuccin
