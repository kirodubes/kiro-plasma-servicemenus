# Changelog

## 2026.06.20

### What Changed
- Synced the service menus from a live Plasma box into the repo.
- **Added `FormatUSB.desktop`** — right-click "Format USB" action (uses `mintstick`;
  self-installs a Solid device action on first use; notifies if `mintstick` is missing).
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

### Notes
- All menus still use the **Plasma 5** service-menu format (`Type=Service` /
  `ServiceTypes=KonqPopupMenu/Plugin`); pending verification they render in Dolphin 6.
- Helper-app deps to declare in the PKGBUILD when packaged: `meld` (compareusingmeld),
  `kdesu` (openthunarasroot), `mintstick` (FormatUSB), `imagemagick` (png/jpg/webp).

### Files Modified
- etc/skel/.local/share/kio/servicemenus/FormatUSB.desktop (new)
- etc/skel/.local/share/kio/servicemenus/png2webp.desktop (new)
- etc/skel/.local/share/kio/servicemenus/jpg2webp.desktop (new)
- etc/skel/.local/share/kio/servicemenus/png2jpg.desktop (black-border fix)
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
