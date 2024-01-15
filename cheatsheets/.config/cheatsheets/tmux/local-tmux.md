# Local TMUX CheatSheet

Focusing on the command aspects, as they aren't covered by the `cheat.sh` cheatsheets.

## Windows

### Creating a new window

> `tmux new-window "curl \"https://cheat.sh/$selected\" | less -r"`

The following will open a new window in tmux specifically for less, once that process quits, the window will close

---

> `tmux new-window -d -t 100 -n 'tmux-exxegutor' 2> /dev/null`

The following will create a new window, but in the background (`-d`) with index 100 and name `tmux-exxegutor`.

---

> `tmux new-window -t $selected_name -c $selected 'git pull'`

The following will target a specific session and create a new window there, with the cwd set to $selected (`-c`) with the command `git pull`


### Sending Keys To Windows

> `tmux send-keys -t $selected_name:0.1 'git pull' Enter`

The following will send the keys `git pull` and press Enter to session: $selected_name, window 0, pane 1 (out of 0,1).
