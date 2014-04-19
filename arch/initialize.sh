#need to add some logic to find root of cloud env based on script location
CLOUD_ENV_ROOT=$HOME/general-environment-setup
CLOUD_SCRIPT_ROOT=$CLOUD_ENV_ROOT/arch

export HOSTINFO=`ip link show`
export HOSTINFO_DIGEST=`echo $HOSTINFO | md5sum`
export HOSTUUID=`uuidgen`
mkdir -p "$CLOUD_ENV_ROOT/hosts

mkdir -p "$HOME/.vim/swaps"
