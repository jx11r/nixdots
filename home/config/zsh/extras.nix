{ }:

''
  # Fix right prompt
  ZLE_RPROMPT_INDENT=0

  # --==[ Key Bindings ]==--
  bindkey '^ ' autosuggest-accept                    # ctrl + space
  bindkey '^[[7~' beginning-of-line                  # ctrl + a
  bindkey '^[[8~' end-of-line                        # ctrl + e
  bindkey '^[[2~' overwrite-mode                     # insert
  bindkey '^[[3~' delete-char                        # delete
  bindkey '^[[C'  forward-char                       # right
  bindkey '^[[D'  backward-char                      # left
  bindkey '^[[5~' history-beginning-search-backward  # page up
  bindkey '^[[6~' history-beginning-search-forward   # page down
  bindkey '^[[1;5D' backward-word                    # ctrl + right
  bindkey '^[[1;5C' forward-word                     # ctrl + left
  bindkey '^H' backward-kill-word                    # ctrl + backspace
  bindkey '^K' backward-kill-line                    # ctrl + k
  bindkey '^[[Z' undo                                # shift + tab
  bindkey '^L' clear-screen                          # ctrl + l

  # - Keycode
  # (crtl + v) + (key combo)
  # - Source
  # https://linux.die.net/man/1/zshzle

  # --==[ Exports ]==--
  export PATH="''${HOME}/.local/bin:''${PATH}"

  # --==[ Autostart ]==--
  # neofetch

  # --==[ Performance ]==--
  # /usr/bin/time zsh -i -c exit
''
