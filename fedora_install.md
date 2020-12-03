# Installing Fedora

## Stuff to install
- [x] github access
- [x] fish shell
- [x] fisher
- [x] fish conf
- [x] asdf
- [x] ruby
- [x] node
- [x] vim plug
- [x] vim conf
- [x] podman
- [x] postgres? (dockerize?)
- [x] PIA vpn


## Open Questions
- Lein? -> There's no officiall support so I need to manually add via it's script and then self install
- SSH setup to my desktop? I'm still hazy on how any of this works
- Laptop restarts after long suspend? What's up with that?
- Backups, how, when, where, why?

### Installing Github
Generate a new ssh key
`ssh-keygen -t rsa -b 4096 -C "btenggren20@gmail.com"`

Add to ssh-agent
`eval "$(ssh-agent -s)"`
`ssh-add ~/.ssh/id_rsa`

Add it to github.com
`sudo dnf install -y xclip`
`xclip -sel clip < ~/.ssh/id_rsa.pub`

-> github.com -> settings -> ssh and gpg keys -> new
Done!

### Installing fish shell, fisher, and conf
`sudo dnf install fish util-linux-user`
figure out which fish  and add it to shells
`echo $(which fish) | sudo tee -a /etc/shells`
`chsh -s $(which fish)`
Fish in this case was /usr/bin/fish
NOTE: You will need to restart to get this to work (I don't know why)

Fisher now!
`curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish`
now we have `fisher` as a bin
from my-config-files/fishfile I can `fisher add <package>`and have that get some more mileage

Conf
`cp my-config-files/config.fish ~/.config/fish/config.fish`

### Install ASDF
Get just the latest branch (in this case 0.7.4)
`git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.4`

Make those autocompletes work in fish  (see: https://asdf-vm.com/#/core-manage-asdf-vm)
`echo 'source ~/.asdf/asdf.fish' >> ~/.config/fish/config.fish` -> This should already be in my config files
`mkdir -p ~/.config/fish/completions; and cp ~/.asdf/completions/asdf.fish ~/.config/fish/completions`

Add the ruby, python, and node plugins (There are more but these are the ones I always need)
`asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git`
`asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git`
Node requires that you import the gpg key as well
`bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring`
`asdf plugin-add python`

### Install ruby, node (these are gonna be required by my neovim setup)
Make sure we have all the packages, We're gonna use develop for everything
`sudo dnf install -y make openssl-devel readline-devel zlib-devel`
`asdf install ruby 2.6.5`
... repeat for node
`asdf global ruby 2.6.5`
... repeat for node

## Install python
Use the fedora package and
`sudo dnf install python -y`

## Skipping ahead a bit (install neovim support)
`gem install neovim`
`npm install -g neovim`
`pip2 install neovim`
`pip3 install neovim`

## Install Neovim (cause it's the best)
`sudo dnf install neovim`

## Install Vim Plug
`curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`

## Migrate over my vimc config
`cp ~/my-config-files/vimrc ~/.config/nvim/init.vim`
pop open that nvim and run `:PlugInstall`

## Docker
`sudo dnf install docker`
`sudo usermod -aG docker $USER`
 And set it up as service so I don't have to worry about it
`sudo systemctl enable docker.service`
`sudo systemctl start docker.service`

You can follow https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-18-04 for the section on executing docker without sudo (which is good and what we want)

## Podman (podman is a replacement for the docker util)
Benefits are that it installs container in a safe user space (no more sudo), you don't need to worry about messing with systemctl, and it will autolink stuff a bit easier. This is good
`sudo dnf install podman`
and we're done. You can just use `podman` binary as a drop in replacement for any `docker` command

## Postgres
I'm going to try working with a dockerized version of postgres not sure what this looks like yet but I think it's gonna be okay.
- I did not end up getting that working

Locally:
`sudo dnf install postgresql-server postgresql-contrib pg_config`
Try to run to make sure we get an error `sudo systemctl start postgres`
`sudo postgresql-setup --initdb --unit postgresql` -> This will setup the initial database, postgres user, and the
`sudo -iu postgres` -> switch to the postgres user
`createuser --interactive` -> Create a database user with your current user

I think this is all the steps. At some point I may have created the linux user postgres with the password postgres for easier rails development


## PIA VPN
This one is tricky cause I'm going to download a script off the internet
`wget https://www.privateinternetaccess.com/installer/pia-nm.sh`
`sudo pia-nm.sh`
The first time you connect to any given server group with the VPN you'll be prompted for a password. After you should be fine reconnecting on demand (It should save the pass)

## Media Codex
UGH.
Fedora. It's all free all open source all the way. Which means proprietary stuff like media drivers and encoders are not included (I forgot about this). So Time to figure out how that works

### Step 1 -> Enable RPM Fusion
https://docs.fedoraproject.org/en-US/quick-docs/setup_rpmfusion/
- Enable both Free and Non-Free? (It's what I'm gonna do) See link above

### Step 2 -> Install ffmpeg?
`dnf install ffmpeg-libs compat-ffmpeg28`
-> Confirm that you trust those sources

### Step 3 -> Also install gstreamer plugins
`dnf install gstreamer1-libav gstreamer1-plugins-ugly`
-> not super sure what these are but they also include things I seem to need
It works! Done!
