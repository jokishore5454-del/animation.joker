# Itachi Web — Performance Optimized

This version keeps the visual design while reducing video and animation stutter.

## Performance changes
- Hero video is remuxed for progressive web playback (`faststart`).
- Removed unused video audio track because the hero is muted.
- Added `preload="metadata"`, `loop`, `playsinline`, and a poster image.
- Pauses the hero video when the tab is hidden or the hero is off-screen.
- Pauses expensive canvas effects when the transformation section is off-screen.
- Lower canvas pixel ratio and fewer particles on touch/low-power devices.
- Reduces mouse/letter/flicker effects on mobile and lower-power devices.
- Removed Git metadata and macOS archive metadata from the deployment package.

## Run locally
Open `naruto.html` through a local web server (recommended) rather than `file://`.

Example:

```bash
python3 -m http.server 8080
```

Then open `http://localhost:8080/naruto.html`.
