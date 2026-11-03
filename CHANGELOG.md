# Changelog

## 2026.11.03

### What Changed
- **The "install mintstick first" warning is now translated into all 13 Kiro languages**
  (de, es, fr, hu, it, ja, nl, pl, pt_BR, ro, ru, tr, zh_CN). Format USB and Write ISO to
  USB used two spellings of the same message ("Please Install The (mintstick) Package
  First" / "Please install the mintstick package first"); both now show the second one,
  from a single helper.
- **Every service-menu label is now translated into the same 13 languages.** All 13 `.desktop`
  files had English-only labels (apart from a Russian meld submenu and three Italian lines);
  each `Name=` and `X-KDE-Submenu=` now carries a `[xx]` line for every language, so Dolphin
  shows the right-click entries in the user's language. The Italian "Format USB" label changed
  from "Partiziona USB" (partition) to "Formatta USB".

### Technical Details
- The labels are standard `.desktop` localized keys, not gettext: Dolphin reads `Name[xx]=`
  itself, so no `.po` entry is needed. The existing Russian meld strings were kept as they were.
  `desktop-file-validate` reports nothing new compared to the English-only files.
- New `.codespellrc` lists the six foreign words codespell flagged (als, openen, ordner, linke,
  formater, somme) instead of skipping `*.desktop`, so the English labels are still spellchecked.
- New helper `etc/skel/.local/share/kio/servicemenus/kiro/mintstick-missing.sh` runs
  `notify-send` through gettext (domain `kiro-plasma-servicemenus`, catalogs in `locale/`
  next to the helper, English fallback when gettext or a catalog is missing). Both
  `.desktop` Exec lines call it via `$HOME/.local/share/kio/servicemenus/kiro/`. It sits in
  a subfolder so Dolphin never mistakes it for a service menu.
- `po/make-mo.sh` (copied from kiro-chadwm's) extracts the `_t` strings into the `.pot`,
  merges each `.po` and compiles the `.mo` files next to the helper. The `.po` headers are set
  to UTF-8 by hand: the source is pure ASCII, so `msginit` wrote `charset=ASCII` and
  `msgmerge` rejected the translations.
- The helper follows the window-manager exception in Kiro-HQ `TEMPLATE_EXCLUSIONS.md`
  (banner header + `set -euo pipefail`, no log suite or ERR trap): Dolphin runs it with no terminal attached.

### Files Modified
- `etc/skel/.local/share/kio/servicemenus/*.desktop` (all 13: localized labels; burniso + FormatUSB also the helper call)
- `etc/skel/.local/share/kio/servicemenus/kiro/mintstick-missing.sh` (new)
- `etc/skel/.local/share/kio/servicemenus/kiro/locale/*/LC_MESSAGES/kiro-plasma-servicemenus.mo` (new, 13)
- `po/` (new: `make-mo.sh`, `kiro-plasma-servicemenus.pot`, 13 `.po`, `LINGUAS`)
- `.codespellrc` (new)
- `README.md`, `CHANGELOG.md`

## 2026.06.20

### What Changed
- Synced the service menus from a live Plasma box into the repo.
- **Added `FormatUSB.desktop`** — right-click "Format USB" action (uses `mintstick`;
  self-installs a Solid device action on first use; notifies if `mintstick` is missing).
- **Added `burniso.desktop`** — right-click an `.iso` → "Write ISO to USB" (mintstick
  ISO-writer mode, `mintstick -m iso -i %f`); notifies if `mintstick` isn't installed.
  Mimetypes `application/x-cd-image` + `application/x-iso9660-image`.
- **`openthunarasroot.desktop`** — de-branded the label (`Open Thunar as root (ArcoLinux)`
  → `Open Thunar as root`) and dropped the `X-KDE-Priority=TopLevel` line.
- **`png2jpg.desktop` — fixed black border.** PNG transparency was flattening to black
  in the JPEG. Now composites over a white background (`-background white -alpha remove
  -alpha off`) and uses `magick` (ImageMagick 7) instead of the deprecated `convert`.
  Verified on a real screenshot: top-left pixel went black → white.
- **Added `png2webp.desktop`** — Convert to → WebP image (preserves alpha).
- **Added `jpg2webp.desktop`** — Convert to → WebP image for JPEGs.
- README de-branded (`edu-plasma-servicemenus` → `kiro-plasma-servicemenus`, clone URL
  and package name updated).
- Added `-quality 90` to all `magick` conversions (`png2jpg`, `png2webp`, `jpg2webp`,
  `webp2jpg`) to match the Thunar custom actions and produce smaller files.

### Ported from Thunar custom actions (Thunar↔Dolphin parity)
Compared `~/.config/Thunar/uca.xml` against the Dolphin service menus and ported the
genuine gaps (skipping anything Dolphin already does natively — terminal-here,
extract/compress, search, copy-location, set-as-wallpaper, disk-usage):
- **`openclaudehere.desktop`** — Open Claude Here (`alacritty --working-directory %f -e claude`).
- **`openvscode.desktop`** — Open in VSCode + Open as root in VSCode (pkexec).
- **`gittyup.desktop`** — Open with gittyup.
- **`checksum.desktop`** — Checksum submenu: sha1 / sha256 / md5 (kdialog popups —
  switched from zenity, which isn't present on Plasma; both zenity and kdialog were
  missing on the box so the click did nothing. `kdialog --msgbox "$(<sum> "$1")"`).
- **`webp2jpg.desktop`** — Convert to → JPEG for WebP files.
- **`makeexecutable.desktop`** — `chmod +x` on selected files.

### Notes
- All menus still use the **Plasma 5** service-menu format (`Type=Service` /
  `ServiceTypes=KonqPopupMenu/Plugin`); pending visual verification they render in Dolphin 6.
- `desktop-file-validate` flags these (strict freedesktop *Application* spec) but KIO
  accepts the KDE service-menu extensions (`Type=Service`, `all/all`, shell `Exec`);
  conversion/checksum/chmod Exec lines were functionally tested on the box.
- Helper-app deps to declare in the PKGBUILD when packaged: `meld` (compareusingmeld),
  `kdesu` (openthunarasroot), `mintstick` (FormatUSB + burniso), `imagemagick`
  (image converters), `code` (VSCode), `gittyup`, `kdialog` (checksums),
  `alacritty` (Open Claude Here).

### Files Modified
- etc/skel/.local/share/kio/servicemenus/FormatUSB.desktop (new)
- etc/skel/.local/share/kio/servicemenus/png2webp.desktop (new)
- etc/skel/.local/share/kio/servicemenus/jpg2webp.desktop (new)
- etc/skel/.local/share/kio/servicemenus/webp2jpg.desktop (new)
- etc/skel/.local/share/kio/servicemenus/openclaudehere.desktop (new)
- etc/skel/.local/share/kio/servicemenus/openvscode.desktop (new)
- etc/skel/.local/share/kio/servicemenus/gittyup.desktop (new)
- etc/skel/.local/share/kio/servicemenus/checksum.desktop (new)
- etc/skel/.local/share/kio/servicemenus/makeexecutable.desktop (new)
- etc/skel/.local/share/kio/servicemenus/png2jpg.desktop (black-border fix + quality)
- etc/skel/.local/share/kio/servicemenus/openthunarasroot.desktop (de-branded)
- README.md (de-branded)

## 2026.05.21

### What Changed
- Initial markdown scaffold added per the ecosystem MD-scaffold rule ([HQ/CLAUDE.md](/home/erik/Insync/Kiro/Kiro-HQ/CLAUDE.md#required-markdown-scaffold-every-repo)).
- Stubs created for `CHANGELOG.md`, `CLAUDE.md`, `IDEAS.md`, `TODO.md` (whichever were missing).
- README rewritten with real install/usage content (replaced earlier one-line stub) where applicable.

### Files Modified
- CHANGELOG.md (created)
- CLAUDE.md (created where missing)
- IDEAS.md (created where missing)
- TODO.md (created where missing)
- README.md (rewritten where it was a stub)
