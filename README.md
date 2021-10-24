# neovim-config
Configuration files for neovim

## Install instructions:
1. ```cd ~/.config/```
1. ```git clone git@github.com:gongfarmer/neovim-config.git nvim```
1. Install plugged: ```curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim```
1. Start neovim and install plugins: ```:PlugInstall```

## Setup for specific plugins
Many plugins require a gem / pyton / deb / npm package to be installed before they work.
For example:
<dl>
<dt>defx</dt>
<dd>pip3 install --user pynvim</dd>
<dt>solargraph</dt>
<dd>gem install solargraph</dd>
</dl>

To see what plugins require supporting packages, run this command from within nvim:
```:checkhealth```
