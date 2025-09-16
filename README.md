# Mattermost on Render (Alpine-based)

This blueprint deploys Mattermost Team Edition with a private Postgres service on Render.

## Deploy
1. Push this repo to GitHub.
2. In Render: **New → Blueprint** → paste repo URL → Deploy.
3. After creation:
   - Open **postgres → Environment**, copy `POSTGRES_PASSWORD`.
   - Open **mattermost → Environment**, set `DB_PASSWORD` to the same value → Save → Redeploy.
   - (Optional) Set `MM_SERVICESETTINGS_SITEURL` to your domain (e.g. `https://chat.example.com`).

## Calls
Enable **System Console → Plugins → Mattermost Calls**. For external networks, configure a TURN server (coturn).

## Notes
- Data is persisted on disks defined in `render.yaml`.
- You can customize any Mattermost setting via env vars prefixed with `MM_`.
