# neovim-config
Configuration files for neovim

## Install instructions:
1. ```cd ~/.config/```
1. ```git clone git@github.com:gongfarmer/neovim-config.git nvim```
1. Start neovim. Lazy package manager will install plugins automatically.
1. Run :checkhealth to make sure everything is working

## Node.js
Some language servers require working node and npm binaries.
This ecosystem moves fast and the debian/ubuntu packaged binaries are typically
too old to run the newer node packages.

This results in neovim opening up a JSON file, for example and immediately showing a cryptic error message like:

    client 1 quit with exit code 1 and signal 0

To fix this, uninstall the debian nodejs package and install your own.

Behind the netapp firewalls, you can find recent versions mirrored here:
    https://repomirror-rtp.eng.netapp.com/nodejs-dist/

Just download the latest binaries, unpack them and put them in your $PATH.

Outside of work, you can manage node with a version manager like [asdf](https://asdf-vm.com)
