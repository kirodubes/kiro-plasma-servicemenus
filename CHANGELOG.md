# Changelog

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
- **`checksum.desktop`** — Checksum submenu: sha1 / sha256 / md5 (zenity popups).
- **`webp2jpg.desktop`** — Convert to → JPEG for WebP files.
- **`makeexecutable.desktop`** — `chmod +x` on selected files.

### Notes
- All menus still use the **Plasma 5** service-menu format (`Type=Service` /
  `ServiceTypes=KonqPopupMenu/Plugin`); pending visual verification they render in Dolphin 6.
- `desktop-file-validate` flags these (strict freedesktop *Application* spec) but KIO
  accepts the KDE service-menu extensions (`Type=Service`, `all/all`, shell `Exec`);
  conversion/checksum/chmod Exec lines were functionally tested on the box.
- Helper-app deps to declare in the PKGBUILD when packaged: `meld` (compareusingmeld),
  `kdesu` (openthunarasroot), `mintstick` (FormatUSB), `imagemagick` (image converters),
  `code` (VSCode), `gittyup`, `zenity` (checksums), `alacritty` (Open Claude Here).

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
