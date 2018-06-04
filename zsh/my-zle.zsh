bindkey "^[i" up-line-or-history
bindkey "^[k" down-line-or-history

bindkey "^[j" backward-char
bindkey "^[J" emacs-backward-word
bindkey "^[l" forward-char
bindkey "^[L" emacs-forward-word

bindkey "^[d" backward-delete-char
bindkey "^[D" backward-kill-word
bindkey "^[f" delete-char-or-list
bindkey "^[F" kill-word
bindkey "^[g" kill-line
bindkey "^[G" backward-kill-line

bindkey "^[h" beginning-of-line
bindkey "^[H" end-of-line

bindkey "^[u" undo
bindkey "^[U" redo

bindkey "^[q" send-break

__mark=0;
my-copy-region-as-kill() {
    zle .copy-region-as-kill;
    __mark=0;
    zle .set-mark-command -n -1;
}
zle -N my-copy-region-as-kill
bindkey "^[w" my-copy-region-as-kill


my-kill-region() {
    zle .kill-regin;
    __mark=0;
    zle .set-mark-command -n -1;
}
zle -N my-kill-region
bindkey "^w"  my-kill-region

bindkey "^[y" yank
bindkey "^[Y" yank-pop

my-set-mark-command() {
    if (( $__mark == 1 ))
    then
        __mark=0;
        zle .set-mark-command -n -1;
    else
        __mark=1;
        zle .set-mark-command;
    fi    
}
zle -N my-set-mark-command
bindkey "^[ " my-set-mark-command

bindkey "^[a" zaw
bindkey "^[s" zaw-history

bindkey -M filterselect "^[i" up-line-or-history
bindkey -M filterselect "^[k" down-line-or-history

bindkey -M filterselect "^[l" forward-char
bindkey -M filterselect "^[L" emacs-forward-word
bindkey -M filterselect "^[j" backward-char
bindkey -M filterselect "^[J" emacs-backward-word

bindkey -M filterselect "^[d" backward-delete-char
bindkey -M filterselect "^[D" backward-kill-word
bindkey -M filterselect "^[f" delete-char-or-list
bindkey -M filterselect "^[f" kill-word
bindkey -M filterselect "^[g" kill-line
bindkey -M filterselect "^[G" backward-kill-line

bindkey -M filterselect "^[g" kill-line
bindkey -M filterselect "^[h" beginning-of-line
bindkey -M filterselect "^[H" end-of-line
bindkey -M filterselect "^[P" beginning-of-history
bindkey -M filterselect "^[N" end-of-history

bindkey -M filterselect "^[q" send-break
