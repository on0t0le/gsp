# gh-switch.plugin.zsh

export GH_PROFILES_DIR="$HOME/.github"

# List profiles
gsp-list() {
  ls "$GH_PROFILES_DIR" 2>/dev/null
}

# Current profile
gsp-current() {
  if [[ -z "$GH_CONFIG_DIR" ]]; then
    echo "default"
  else
    basename "$GH_CONFIG_DIR"
  fi
}

# Switch profile
gsp() {
  local profile="$1"

  if [[ -z "$profile" ]]; then
    echo "Usage: gsp <profile>"
    return 1
  fi

  local profile_dir="$GH_PROFILES_DIR/$profile"

  if [[ ! -d "$profile_dir" ]]; then
    echo "Profile '$profile' not found in $GH_PROFILES_DIR"
    return 1
  fi

  export GH_CONFIG_DIR="$profile_dir"
  unset GH_TOKEN
  unset GITHUB_TOKEN

  echo "Switched to GitHub profile: $profile"
}

# -------- Autocomplete --------
_gsp_autocomplete() {
  local -a profiles
  profiles=(${(f)"$(gsp-list)"})
  _describe 'profiles' profiles
}

compdef _gsp_autocomplete gsp

# -------- Auto-switch per directory --------
autoload -U add-zsh-hook

load-gh-profile-from-dir() {
  if [[ -f .gh-profile ]]; then
    local profile=$(cat .gh-profile)
    if [[ "$profile" != "$(gsp-current)" ]]; then
      gsp "$profile" >/dev/null
    fi
  fi
}

add-zsh-hook chpwd load-gh-profile-from-dir
load-gh-profile-from-dir
