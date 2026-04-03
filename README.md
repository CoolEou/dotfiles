# dotfiles

These are my dotfiles :)  
My main focus for this project has been on creating a structure that is scalable and configurations that will work on any of the platforms I might find my self working on, so that I can quickly and easily expand this as my needs grow, as well as setup my development environment on a new machine, regardless of which OS is installed. 

## Installation

### Bootstrap script

To easily setup the dotfiles, I've created a bootstrap script that, when run from the repo root, will link the files from the repo to the correct config locations that each application expects. It is designed to let you decide which configs should be set up, allowing for a flexible install. To choose which applications to include, simply specify one or more of the following possible arguments when running the bootstrap script:

| Application      | Argument   |
|:-----------------|:-----------|
| WezTerm          | --wezterm  |
| Zsh              | --zsh      |
| All of the above | --all      |

### Prerequisites

- **The Applications**  
    Of course to use these dotfiles, you'll need to also install the specific applications that the dotfiles are intended to configure.

    Some applications you'll have to install on your own, but for some applications I've created install scripts to make this process easier.
    
    The bootstrap script will tell you if you should install an aplication on your own and ask you if you want to run the install script if available.
    
- **A Nerd Font** 
    The Powerlevel10k theme expects a Nerd Font to be used and the WezTerm config specifically expects JetBrainsMono NFM (Nerd Font Mono), which is what I use and have tested. Feel free to pick a different nerd font, just remember to then change the font in the [WezTerm config](wezterm/wezterm.lua) ;).

    Nerd fonts can be found and downloaded [here](https://www.nerdfonts.com/).

### Linux-Install

Clone the repo to ~/.dotfiles:

```bash
git clone https://github.com/CoolEou/dotfiles.git ~/.dotfiles  
```

cd into the .dotfiles folder:

```bash
cd ~/.dotfiles  
```

Run the bootstrap script:

```bash
./bootstrap.sh --all
```

### Windows-Install

The flexibility of the bootstrap script especially becomes handy when installing on Windows, as not everything will work on Windows it self, and not everything can be installed in WSL. 

Applications like Zsh will only work in WSL, while applications like WezTerm wont run inside WSL. 

So when installing on Windows you'll have to install certain applications inside WSL, for which you can follow the Linux install guide, but instead of 

```bash
./bootstrap.sh --all
```

You should only include the WSL applications, e.g.:

```bash
./bootstrap.sh --zsh
```

The applications that should be installed outside of WSL have been included as submodules in this repo, so to install these, you should go to the specific submodule which will have a guide on how to install that specific application.

## Credits
I've by no means created all of this my self. Apart from some discussions with ChatGPT to figure out things like bash scripts, here are some of the places I've found inspiration:
- The WezTerm and Zsh setup is largely inspired by [Josean Martinez's setup guide](https://www.josean.com/posts/how-to-setup-wezterm-terminal).
- The [Powerlevel10k config](zsh/p10k.zsh) is a very slightly modified version of [Tolkonepiu's lean catppuccin mocha theme](https://github.com/tolkonepiu/catppuccin-powerlevel10k-themes).
- The OS detection in my WezTerm config is from [Kevin Silvester's config](https://github.com/KevinSilvester/wezterm-config).
- I got inspiration on how to handle and structure a public dotfiles repo from [Holman's dotfiles repo](https://github.com/holman/dotfiles).