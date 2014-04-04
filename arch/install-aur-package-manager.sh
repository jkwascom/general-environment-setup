mkdir ~/builds
cd ~/builds
curl -O https://aur.archlinux.org/packages/au/aurget/aurget.tar.gz
tar -xzf aurget.tar.gz
cd aurget
makepkg -s
sudo pacman -U aurget-4.0.16-1-any.pkg.tar.xz
