# gh-switch (ZSH Plugin)

Switch between multiple GitHub accounts for gh CLI using profiles.

## Features

- Multiple GitHub accounts using `gh auth login`
- Profiles stored in `~/.github/<profile>`
- Autocomplete for profile names
- Auto-switch per directory via `.gh-profile`
- AWS-style workflow for GitHub CLI

---

## Installation

~/.oh-my-zsh/custom/plugins/gh-switch

Add to `.zshrc`:

plugins=(... gh-switch)

Reload:

source ~/.zshrc

---

## Setup Profiles

GH_CONFIG_DIR=~/.github/work gh auth login

GH_CONFIG_DIR=~/.github/personal gh auth login

---

## Usage

gsp work
gsp personal

gsp-list
gsp-current

---

## Autocomplete

Type:

gsp <TAB>

Shows available profiles.

---

## Auto-switch per directory

echo "work" > .gh-profile

---

## Notes

- Uses GH_CONFIG_DIR
- Tokens handled by gh CLI
