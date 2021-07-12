# Create vim dir

```sh
mkdir ~/.config/nvim
touch ~/.config/nvim/init.vim
```

Or use the git folder directly.

# Requirements

- ranger
- ripgrep
- fzf
- universal-ctags
- silver-searcher
- fd-find

```sh
sudo pacman -S fzf
sudo pacman -S the_silver_searcher
sudo pacman -S ripgrep
```

# Install vim plug

```sh
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

# Lsp

It riquire to have nodejs installed.

```sh
sudo apt install -y nodejs
npm i -g yarn
```

## Install some servers

```sh
npm i -g pyright
sudo pacman -S clang
```

And then enable them into `~/.config/nvim/plug-config/lsp-servers.vim` like
this:

```lua
require'lspconfig'.clangd.setup{}
require'lspconfig'.pyright.setup{}
```
