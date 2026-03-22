function get_catppuccin_color() {
  local flavor="${(U)$(get_catppuccin_flavor)}"
  local color_name="${(U)1}"
  local var_name="CATPPUCCIN_${flavor}_${color_name}"

  echo "${(P)var_name}"
}

function directory_prompt() {
   local prev_bg=$1
   local current_bg=$2
   local current_fg=$3

   generate_prompt $1 $2 $3 " %4~ "
}

function end_prompt {
   generate_prompt $1 $2 $3 ""
}

function generate_prompt() {
   local prev_bg=$1
   local current_bg=$2
   local current_fg=$3
   local text=$4
   local symbol_prompt="%F{$prev_bg}%K{$current_bg}%k%f"
   local text_prompt="%F{$current_fg}%K{$current_bg}$text%k%f"
   local p=$(printf '%s%s' $symbol_prompt $text_prompt)

   reply=($p $current_bg)
}

function git_prompt() {
   if command -v git &> /dev/null && git rev-parse --is-inside-work-tree &> /dev/null; then
      local text=""
      local branch="$(git branch --show-current)"
      if [[ -n "$branch" ]]; then
         text=$(echo "  $branch ")
      fi

      generate_prompt $1 $2 $3 $text
   else
      reply=("\0" $1)
   fi
}

function vi_mode {
  local fg="$1"
  echo "%F{$fg}${ZVM_MODE:u}%f"
}

function prompt() {
   v=$(vi_mode "$(get_catppuccin_color peach)")

   directory_prompt "$(get_catppuccin_color base)" "$(get_catppuccin_color mauve)" "$(get_catppuccin_color base)"
   d=("${reply[@]}")

   git_prompt $d[2] "$(get_catppuccin_color sky)" "$(get_catppuccin_color base)"
   g=("${reply[@]}")

   end_prompt $g[2] "$(get_catppuccin_color base)" "$(get_catppuccin_color base)"
   e=("${reply[@]}")

   echo "$v$d[1]$g[1]$e[1] "
}

setopt prompt_subst
export PS1='$(prompt)'
