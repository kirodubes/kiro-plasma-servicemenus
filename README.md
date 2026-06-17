<p align="center">
  <img src="kiro.jpg" alt="Kiro" width="220" />
</p>

# kiro-plasma-servicemenus

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
sudo pacman -S kiro-plasma-servicemenus
```

### Manual

```bash
git clone https://github.com/kirodubes/kiro-plasma-servicemenus.git
cd kiro-plasma-servicemenus
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

<!-- KIRO-FUNDING-FOOTER:START — managed by Kiro-HQ/cascade-readme-footer.sh -->
## Help fund Kiro

Everything I build here stays free and open — always. If Kiro or any of these
tools have ever saved you time or taught you something, a small monthly
contribution helps keep the work going. Donations target break-even, nothing
more — the core always stays free for everyone.

- GitHub Sponsors: https://github.com/sponsors/erikdubois
- Patreon: https://www.patreon.com/c/kiroproject
- YouTube memberships: https://www.youtube.com/@ErikDubois/join
- Ko-fi: https://ko-fi.com/erikdubois
- PayPal: https://www.paypal.me/erikdubois
<!-- KIRO-FUNDING-FOOTER:END -->

## License

See [LICENSE](./LICENSE).
