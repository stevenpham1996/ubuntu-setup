export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="/home/olaviolacerda/.oh-my-zsh"

ZSH_THEME="spaceship"

plugins=(git)

source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  node          # Node section
  package       # package
  docker        # Docker section
  exec_time     # Execution time
  line_sep      # Line break
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
SPACESHIP_USER_SHOW=always
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_CHAR_SYMBOL="⇝" # ❯, ➻, ➳, ⟜, ⟿, 
SPACESHIP_CHAR_SUFFIX=" "
SPACESHIP_TIME_SHOW=true

zinit light zdharma/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
