# Cosmos-Hypr

**Cosmos-Hypr** is a Hyprland rice I created, with Catppuccin Macchiato colors!

## Image
![The rice in use](using.png)

## Installation
There are *two methods* to install this rice

### Method 1 - Using [Rancher](https://codeberg.org/StikyPiston/rancher)

Firstly, ensure you have **Rancher** (and **Ruby**) installed. Install **Rancher** with:

```bash
curl -fsSL https://codeberg.org/StikyPiston/rancher/raw/branch/main/onlineinstall.sh | sh
```

Run `rancherfetch https://codeberg.org/stikypiston/cosmos-hypr` to install the rice.

To activate the rice, ensure all dependencies are installed, and run `rancher activate cosmos-hypr`

### Method 2 - Manual Install

Run `git clone https://codeberg.org/StikyPiston/cosmos-hypr`

Copy the contents of `config` to `~/.config/`

Install any needed deps (hyprland, waybar, wofi, etc.), and there you go!
