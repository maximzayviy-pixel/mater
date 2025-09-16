# Mattermost on Render (with explicit Postgres hostname)

This blueprint pins the DSN to the actual pserv hostname `postgres-74j4`,
so you don't need to adjust the env var manually in the dashboard.

## Steps
1. Replace `__PASTE_SAME_PASSWORD__` with your chosen strong password in both places.
   - If it contains special chars, URL-encode them in the DSN.
2. Push to GitHub → Render → New → Blueprint → Deploy.
3. Open the Mattermost URL, complete the setup wizard.
4. Enable **System Console → Plugins → Mattermost Calls** for voice/video.

Example DSN (with URL-encoded `!`):
postgres://mmuser:MyStrongPass123%21@postgres-74j4:5432/mattermost?sslmode=disable&connect_timeout=10
