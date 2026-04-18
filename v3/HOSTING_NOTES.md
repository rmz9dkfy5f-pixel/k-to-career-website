# Hosting & Domain Notes
**Version:** 1.2.0 | **Date:** 2026-04-18

---

## Domain
- **Target domain:** `www.ktocareer.org`
- Canonical URL is already set in the HTML: `<link rel="canonical" href="https://www.ktocareer.org">`
- Update the canonical tag if the final domain differs

---

## Current Hosting (Development)
- **Platform:** GitHub Pages
- **Repo:** `k-to-career-website` (main branch)
- **Served from:** `v3/` directory
- **HTTPS:** Provided automatically by GitHub Pages

---

## Target Hosting (Client — Wix)

### What Wix Handles Automatically
- HTTPS / SSL certificate
- HSTS (HTTP Strict Transport Security)
- CDN delivery
- DDoS protection

### What Wix Does Not Support
- Custom HTTP headers (CSP, X-Frame-Options) — Wix manages these at infrastructure level
- Raw HTML page hosting (Wix uses its own editor and page structure)
- `.htaccess` or server config files

### Connecting the Domain on Wix
1. Log in to Wix dashboard
2. Go to **Settings → Domains**
3. Click **Connect a domain you already own**
4. Enter `ktocareer.org`
5. Follow Wix's DNS instructions (update A record and CNAME at domain registrar)
6. Set `www.ktocareer.org` as the primary domain

### DNS Records Required (Wix standard)
| Type | Host | Value |
|---|---|---|
| A | @ | 23.236.62.147 (Wix IP — confirm in Wix dashboard) |
| CNAME | www | username.wixsite.com |

> Always verify current Wix DNS values in the Wix dashboard — they can change.

---

## If Hosting Outside Wix (GitHub Pages / Netlify / Vercel)

### GitHub Pages
- Push `v3/` to the repo
- Enable Pages in repository settings → set source to `v3/` folder on `main`
- Custom domain: add `www.ktocareer.org` in Pages settings, add CNAME file

### Netlify
- Drag and drop the `v3/` folder into Netlify's deploy UI
- Connect custom domain in Netlify dashboard
- Add `netlify.toml` to set security headers (CSP, X-Frame-Options)

### Vercel
- Import repo, set root directory to `v3/`
- Connect custom domain in Vercel dashboard
- Add `vercel.json` for security headers

---

## Email
- `info@ktocareer.org` is linked in the footer as a `mailto:` link
- Ensure this inbox is active before public launch
