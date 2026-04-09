#!/bin/bash

theme=$1;

case $theme in

    gruvbox)
        echo "gruvbox"
        sed -i 's;themes.*$;themes/gruvbox;' ~/.config/foot/foot.ini

        ;;

    catppuccin)
        echo "catppuccin"
        sed -i 's;themes.*$;themes/catppuccin-mocha;' ~/.config/foot/foot.ini
        ;;
    *)
        echo "theme not found"
        ;;
esac
