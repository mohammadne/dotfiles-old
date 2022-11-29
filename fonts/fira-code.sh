#! /bin/bash

font_family="FiraCode"
font_weights="Bold SemiBold Medium Regular Light"
font_repository="https://github.com/ryanoasis/nerd-fonts"

font_home=$([ "$(uname)" = "Darwin" ] && echo ~/Library/Fonts || echo ~/.local/share/fonts)
font_home="$font_home/$font_family"

echo "Installing "$font_family" font ..."
for weight in $font_weights; do
    mkdir -p $font_home && cd $font_home
    curl -fLo "$weight.ttf" "$font_repository/raw/master/patched-fonts/$font_family/$weight/complete/Fira%20Code%20$weight%20Nerd%20Font%20Complete.ttf"
done

# reset font cache on Linux
if [ "$(uname)" != "Darwin" ] && (command -v fc-cache &> /dev/null) ; then
    echo "Resetting font cache ..."
    fc-cache -f "$font_home"
fi
