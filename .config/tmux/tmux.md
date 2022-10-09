# TMUX

## commands

- `tmux`: start tmux session
- `tmux a`: reattach to a detach session
- `tmux new-session`: start a new session
- `tmux new -s [name]`: start a new session with a name
- `tmux neww`: start a new window
- `tmux attach -t [name]`: reattach to a session with a name
- `tmux ls`: list all sessions
- `tmux kill-session -t [name]`: kill session with a name
- `exit`: quit the tmux session your in

## Keybindings

| control   | effect                                             |
|-----------|----------------------------------------------------|
| `C-b d`   | detach                                             |
| `C-b c`   | create window                                      |
| `C-b l/p` | last window                                        |
| `C-b n`   | go to *n* window                                   |
| `C-b [`   | copy mode (vim keys / q to quit / space to select) |
| `C-b %`   | vertical split                                     |
| `C-b "`   | horizontal split                                   |

## Usefull with vim

use the following in 2 different terminal. It allows to have the same session
in two different terminal.

```bash
tmux new-session -t 1 # in one terminal
tmux new-session -t 1 -s name # in another terminal
```
