# Itachi Website + Media Admin

This package adds a private admin dashboard for changing the live background music, hero video, poster, and three transformation images without rebuilding the public website.

## 1. Create Supabase
1. Create a Supabase project.
2. Open SQL Editor.
3. Run `supabase-setup.sql`.
4. In Authentication > Providers, enable Email/password.
5. Create your admin user (or use the admin dashboard's Create admin account button).

## 2. Connect the public site
Edit `site/config.js` and set:
- `supabaseUrl` = your project URL
- `supabaseAnonKey` = your anon/public key

Never put the Supabase `service_role` key in the website or admin dashboard.

## 3. Connect the admin
Open `admin/index.html`, enter the same Supabase URL + anon/public key, then sign in.

## 4. Deploy
Deploy `site/` as the public Itachi website and `admin/` as a separate private admin site. Netlify can host both as separate sites.

## Live editing
The public site checks the `site_media` record every 60 seconds. Uploading a new asset in the admin updates the record, so a Netlify rebuild is not required. Existing visitors will pick up the new asset on the next refresh; a browser may retain a cached media file briefly.

## Recommended media
- Hero video: MP4/H.264, preferably under 20–30 MB.
- Music: MP3 or AAC for smaller downloads.
- Images: WebP/JPEG where possible.

The original local files remain in the public site as fallbacks if Supabase is not configured.
