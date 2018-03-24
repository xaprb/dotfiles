REPO="$HOME/repos/xaprb/dotfiles"
for DOTFILE in `cat "$REPO/dotfiles"`
do
	[ -f "$REPO/$DOTFILE" ] && . "$REPO/$DOTFILE"
done

for SYMLINK in `cat "$REPO/symlinks"`
do
	[ -f "$REPO/$SYMLINK" ] && ln -sF "$REPO/$SYMLINK" "$HOME/.$SYMLINK"
done
