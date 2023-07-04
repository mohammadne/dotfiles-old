#! /bin/bash

font_family="FiraCode"
font_weights="Bold SemiBold Medium Regular Light"
font_repository="https://github.com/ryanoasis/nerd-fonts"
font_version="3.0.2"
font_home="$HOME/.local/share/fonts/$font_family"

echo "Installing "$font_family" font ..."
for weight in $font_weights; do
    mkdir -p $font_home && cd $font_home
    curl -fLo "$weight.ttf" "$font_repository/raw/$font_version/patched-fonts/$font_family/$weight/FiraCodeNerdFont-$weight.ttf"
done

# install fontconfig if fc-cache not found
if !(command -v fc-cache &> /dev/null) ; then
    echo "installing required packages for font ..."
    sudo dnf install -y fontconfig
fi

# reset font cache
echo "Resetting font cache ..."
fc-cache -f "$font_home"
