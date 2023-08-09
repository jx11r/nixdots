{ }:

''
  #!/bin/sh

  [[ -e ~/.ssh/github ]] && {
    { ssh-add -q ~/.ssh/github; } &>/dev/null
  }
''
