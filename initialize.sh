#need to add some logic to find root of cloud env based on script location
TARGET_DIR=$HOME
CLOUD_ENV_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CLOUD_SCRIPT_ROOT=$CLOUD_ENV_ROOT/arch
LOCAL_ZSH_SCRIPT="$HOME/.zshrc"

[[ -e $LOCAL_ZSH_SCRIPT ]] && echo "$LOCAL_ZSH_SCRIPT already exists!" && exit -1

echo 'source "$HOME/general-environment-setup/configs/.zshrc"' >> $LOCAL_ZSH_SCRIPT

#export HOSTINFO=`ip link show`
#export HOSTINFO_DIGEST=`echo $HOSTINFO | md5sum`
#export HOSTUUID=`uuidgen`
#mkdir -p "$CLOUD_ENV_ROOT/hosts"
#
#mkdir -p "$HOME/.vim/swaps"
