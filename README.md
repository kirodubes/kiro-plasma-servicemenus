<p align="center">
  <img src="kiro.jpg" alt="Kiro" width="220" />
</p>

# edu-plasma-servicemenus

Right-click context-menu extensions for KDE Plasma's file manager (Dolphin) — adds useful actions like "Open in terminal here", "Copy path", and other workflow shortcuts. Part of the `~/EDU/` learning series.

## What's in this repo

- `etc/skel/` — Plasma service-menu `.desktop` files that land in `/etc/skel/.local/share/kio/servicemenus/` (or the system-wide equivalent).
- `setup.sh`, `up.sh` — standard EDU bash scaffold.

## Installation

### From `nemesis_repo` (recommended)

```ini
[nemesis_repo]
SigLevel = Never
Server = https://erikdubois.github.io/$repo/$arch
```

```bash
sudo pacman -Syu
sudo pacman -S edu-plasma-servicemenus-git
```

### Manual

```bash
git clone https://github.com/erikdubois/edu-plasma-servicemenus.git
cd edu-plasma-servicemenus
sudo cp -r etc/skel/. /etc/skel/
```

Existing users can copy directly into their own home:

```bash
cp -rT /etc/skel ~/
```

The new menu entries become available in Dolphin the next time you open the right-click menu.

## Websites

Information : https://erikdubois.be

## Social Media

Youtube : https://www.youtube.com/erikdubois

## License

See [LICENSE](./LICENSE).
