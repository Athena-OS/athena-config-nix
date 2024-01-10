for file in *.desktop; do
    sed -i -e 's/if command -v.*sudo pacman -S/nix-shell -p/g' -e 's/\$SHELL --command 'fi;/ return/g' "$file"
done
