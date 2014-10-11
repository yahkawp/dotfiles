#!/bin/sh

cwd=$(pwd)

trash=$HOME/trash
aux=$HOME/aux
bins=$HOME/bins

[ -d "$trash" ] || mkdir $trash

[ "$1" = "reset" ] && { rm -rf $HOME/aux ; }

[ -d "$aux" ] || mkdir $aux

rm -f $aux/dotfiles
ln -s $(pwd) $aux/dotfiles

[ -d "$bins" ] || mkdir $bins
rm -f $bins/dotfiles
ln -s $(pwd)/bin $bins/dotfiles

for f in *; do
	[ -d "$f" ] || continue

	case $f in
	*_dotfiles) 
		for ff in $f/*; do
			[ -e "$ff" ] || continue

echo "ff "  $ff
			bn=$(basename $ff)

            [ -z $bn ] && continue
			t="$trash"/$(date +"%Y%m%d%M%S")
			[ -d "$t" ] || mkdir -p  $t
			[ -e "$HOME/.$bn" ] && { mv $HOME/.$bn $t/ ; }
			rm -rf $HOME/.$bn
			ln -s 	$cwd/$ff $HOME/.$bn
		done
	;;
	*_dotdir) 
		bn=$(basename $f)
        	name=${bn%_*}
		    rm -rf $HOME/.$name
		    ln -s $cwd/$f $HOME/.$name
	;;
	*)
		t="$trash"/$(date +"%Y%m%d%M%S")
		[ -d "$t" ] || mkdir -p  $t
		[ -e "$HOME/.$f" ] && { mv $HOME/.$f $t/ ; }
		rm -rf $HOME/.$f 
        	ln -s 	$cwd/$f $HOME/.$f
	;;
	esac
done
