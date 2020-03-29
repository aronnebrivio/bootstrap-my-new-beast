# 🚀 Bootstrap my new beast
> I made this repository just because I'm too lazy to install and configure every application every time I change my PC / OS.

Running this script will setup a fresh machine with some stuff like [fish shell](https://fishshell.com/), [Docker](https://www.docker.com/) and [VSCode](https://code.visualstudio.com/) (see [section below](#stuff)). Maybe you want to take a look to my [.dotfiles](https://github.com/aronnebrivio/dotfiles) too!

After cloning this repo, run `./install` to automatically set up the development environment.

## <a name="stuff"></a>Random stuff will be installed

General
- git
- git-flow-avh
- fish
- oh-my-fish
- neovim
- colorls
- VSCode
- some [nerd fonts](https://github.com/ryanoasis/nerd-fonts)
- ~~[portainer](https://www.portainer.io/)~~
- [.dotfiles](https://github.com/aronnebrivio/dotfiles)

Linux (Debian/Ubuntu flavoured)
- docker

MacOS
 - brew

### Note
If you're on MacOS you'll have to install [Docker Desktop](https://www.docker.com/) (until I find a way to do it from the CLI).

## Test it out!
YAY! You can test the script in an Ubuntu 18.04 container (*without messing out your PC)*:
```bash
docker-compose up -d
docker exec -it ubuntu-test bash

# Clone the repository
git clone https://github.com/aronnebrivio/bootstrap-my-new-beast.git

# Run the script
cd bootstrap-my-new-beast
./install
```

The password for the default user `testuser` is `password` (*you don't say?*), needed for **sudo** privileges.
You'll have to choose *option 1* since is an Ubuntu image.

**Did you break something?** Just `docker-compose down` and start again.

## Todo
- [ ] `bobthefish` shell theme
- [ ] Docker for MacOS
- [ ] ~~fix all the mess~~ *Sorry, I won't*
