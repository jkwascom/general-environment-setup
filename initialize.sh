#need to add some logic to find root of cloud env based on script location
TARGET_DIR=$HOME
CLOUD_ENV_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
LOCAL_ZSH_SCRIPT="$TARGET_DIR/.zshrc"
LOCAL_VIM_SCRIPT="$TARGET_DIR/.vimrc"

[[ -e $LOCAL_ZSH_SCRIPT ]] && echo "$LOCAL_ZSH_SCRIPT already exists!" && exit -1

echo "export CLOUD_ENV_ROOT=\"$CLOUD_ENV_ROOT\"" >> $LOCAL_ZSH_SCRIPT
echo "export CLOUD_SCRIPT_ROOT=\"$CLOUD_ENV_ROOT/arch\"" >> $LOCAL_ZSH_SCRIPT
echo "export CLOUD_CONFIG_ROOT=\"$CLOUD_ENV_ROOT/configs\"" >> $LOCAL_ZSH_SCRIPT
echo 'source "$CLOUD_CONFIG_ROOT/$USER.zshrc"' >> $LOCAL_ZSH_SCRIPT

[[ -e $LOCAL_VIM_SCRIPT ]] && echo "$LOCAL_VIM_SCRIPT already exists!" && exit -1

echo "source $CLOUD_ENV_ROOT/configs/$USER.vimrc" >> $LOCAL_VIM_SCRIPT

#export HOSTINFO=`ip link show`
#export HOSTINFO_DIGEST=`echo $HOSTINFO | md5sum`
#export HOSTUUID=`uuidgen`
#mkdir -p "$CLOUD_ENV_ROOT/hosts"
#
#mkdir -p "$HOME/.vim/swaps"
