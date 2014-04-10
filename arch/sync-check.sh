#!/usr/bin/zsh
CLOUD_ENV_ROOT="workspace/cygwin/google-docs/cloud-workspace"
CLOUD_CONFIG_ROOT="$CLOUD_ENV_ROOT/setup/configs"
CLOUD_PACKAGELIST_ROOT="$CLOUD_ENV_ROOT/setup/packages"
LOCAL_PACKAGELIST_ROOT="/tmp"
LOCAL_CONFIG_ROOT="$HOME"
MODE="check"
PACKAGELIST_SUFFIX="pkglist"
PACMAN_LIST="pacman.$PACKAGELIST_SUFFIX"
PIP_LIST="pip.$PACKAGELIST_SUFFIX"
VIM_LIST="vim.$PACKAGELIST_SUFFIX"
if [[ "$1" == "show" ]] {
  MODE="show"
}

generate_package_lists() {
  pacman -Qqe > "$1/$PACMAN_LIST"
  pip list > "$1/$PIP_LIST"
  vim -c "redir @\" | silent NeoBundleList | redir END | set paste | exe \"normal pddggVG:sort\" | x! $1/$VIM_LIST"
}

check_up_to_date () {
  LOCAL_ROOT="$1"
  CLOUD_ROOT="$2"
  SYNC_FILE_NAME="$3"
  test `diff $LOCAL_ROOT/$SYNC_FILE_NAME $CLOUD_ROOT/$SYNC_FILE_NAME  | wc -l` -eq 0 && return 0
  echo "$SYNC_FILE_NAME differs"
  if [[ $MODE == "show" ]] {
    show_diff $LOCAL_ROOT/$SYNC_FILE_NAME $CLOUD_ROOT/$SYNC_FILE_NAME
  }
}

show_diff () {
  git diff --no-index $1 $2
}

#ls -A1 workspace/cygwin/google-docs/cloud-workspace/setup/configs | xargs -I% check_up_to_date $LOCAL_CONFIG_ROOT $CLOUD_CONFIG_ROOT %
check_up_to_date $LOCAL_CONFIG_ROOT $CLOUD_CONFIG_ROOT '.zshrc'
check_up_to_date $LOCAL_CONFIG_ROOT $CLOUD_CONFIG_ROOT '.tmux.conf'
check_up_to_date $LOCAL_CONFIG_ROOT $CLOUD_CONFIG_ROOT '.vimrc'
check_up_to_date $LOCAL_CONFIG_ROOT $CLOUD_CONFIG_ROOT '.screenrc'
generate_package_lists $LOCAL_PACKAGELIST_ROOT
#ls -A1 workspace/cygwin/google-docs/cloud-workspace/setup/packages | xargs -I% check_up_to_date $LOCAL_PACKAGELIST_ROOT $CLOUD_PACKAGELIST_ROOT %
check_up_to_date $LOCAL_PACKAGELIST_ROOT $CLOUD_PACKAGELIST_ROOT $PACMAN_LIST
check_up_to_date $LOCAL_PACKAGELIST_ROOT $CLOUD_PACKAGELIST_ROOT $PIP_LIST
check_up_to_date $LOCAL_PACKAGELIST_ROOT $CLOUD_PACKAGELIST_ROOT $VIM_LIST
