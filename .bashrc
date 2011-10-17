alias cls='clear; ls'
alias ll='ls -l'
alias md5sum='md5 -r'
alias vv='vim -S'

export CLICOLOR=1
export PS1='[$(__git_ps1 "%s")] \w\$ '
export PATH=/opt/local/bin:$PATH
export PATH=/usr/local/bin:$PATH
#export GLANCESRC=~/Projects/glance
export GLANCEIMAGES=~/Projects/glance-images
export REDDWARF_EXTRA=~/reddwarf-extra

function svn {
  echo I think you meant git.
  git $@
}

function synchro {
  echo git pull --rebase upstream reddwarf/master
  git pull --rebase upstream reddwarf/master
}

function transmit {
  echo git push origin $(__git_ps1 "%s")
  git push origin $(__git_ps1 "%s")
}

function transmit-force {
  echo git push origin $(__git_ps1 "%s") --force
  git push origin $(__git_ps1 "%s") --force
}

set show-all-if-ambiguous on
. ~/.git-completion.bash

function savestate {
    echo git stash save
    git stash save
}

function loadstate {
    echo 'git stash apply stash@{0}'
    git stash apply stash@{0}
}

function dont { :; }