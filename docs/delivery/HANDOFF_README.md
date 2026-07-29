# K to Career — v3 Handoff README
**Version:** 1.2.0
**Date:** 2026-04-18
**Status:** Production-ready static reference page

---

## What This Is

A fully audited, production-ready single-page HTML site for K to Career. It is designed as either:

1. A **live deployable page** hosted on GitHub Pages or any static host
2. A **design and content reference** for rebuilding in Wix

---

## File Structure

As of `v1.3.0`, these files live at the repository root on `main` (previously under `v3/`):

```
index.html              ← Full page (HTML + CSS + JS, self-contained)
favicon-32.png          ← Browser tab icon (32×32)
apple-touch-icon.png    ← iOS home screen icon (180×180)
assets/
  └── images/
      └── logo.png      ← Brand logo (3840×2160 PNG)
```

---

## Wix Integration Options

### Option A — Rebuild in Wix Editor (Recommended for full Wix site)
Use `index.html` as the design and content specification. Recreate each section in Wix's drag-and-drop editor. Content, copy, colors, and section order are all documented in the HTML.

**Color tokens for Wix:**
| Name | Hex |
|---|---|
| Navy | `#0B1F3A` |
| Teal | `#0F6E56` |
| Teal Light | `#1D9E75` |
| Amber | `#BA7517` |
| Amber Light | `#FAC775` |
| Muted | `#5A6A7A` |

**Fonts:** DM Serif Display (headings) · DM Sans (body) — both available on Google Fonts

### Option B — Embed via Wix HTML Widget
1. In Wix Editor, add an **Embed HTML** widget
2. Paste the full contents of `index.html`
3. Set widget dimensions to 100% width, full height
4. **Note:** This method has SEO limitations — search engines may not index embedded HTML content

### Option C — Host Externally, Link from Wix
Host the site on GitHub Pages or Netlify. Link to it from the Wix site as a standalone page or open in a new tab.

---

## Pre-Launch Checklist

- [ ] Connect domain `www.ktocareer.org` to chosen host
- [ ] Replace `href="#"` nav logo link with final homepage URL
- [ ] Wire "Apply for PATHWAYS", "Express interest", and "Support K to Career" CTAs to real destinations (form, email, or donation page) when ready
- [ ] Confirm session dates and add to the PATHWAYS schedule table
- [ ] Confirm location, cost, and eligibility details
- [ ] Add `og:image` meta tag once a social sharing image is available
- [ ] Verify `info@ktocareer.org` is active and monitored

---

## What Is Already Done

- Meta description, Open Graph, and Twitter Card tags
- Canonical URL set to `https://www.ktocareer.org`
- Favicon and Apple touch icon
- Mobile responsive (hamburger menu at 600px)
- Accessibility: `<main>` landmark, `aria-hidden` on decorative icons, semantic headings
- Performance: CLS-fixed images, LCP hint on nav logo, lazy-loaded footer logo, font preconnect
- No placeholder metrics, fabricated testimonials, or unverified partner names

---

## Known Limitations

- Server-level security headers (CSP, X-Frame-Options) cannot be set on Wix or GitHub Pages — both platforms manage infrastructure security internally
- `og:image` is not set — a dedicated social sharing image is needed before launch
