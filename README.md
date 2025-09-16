# Mattermost on Render (Blueprint)

This repo deploys Mattermost Team Edition with a private Postgres on Render.

## What gets created
- **Web service**: Mattermost (port 8065) with a persistent disk at `/mattermost/data`.
- **Private service**: Postgres 16 with a persistent disk at `/var/lib/postgresql/data`.

## Deploy
1. Push this repo to GitHub.
2. In Render: **New + → Blueprint** → paste repo URL → Deploy.
3. After services are created:
   - Open **postgres → Environment**, copy `POSTGRES_PASSWORD`.
   - Open **mattermost → Environment**, set `DB_PASSWORD` to the same value and Save.
   - (Optional) Set `MM_SERVICESETTINGS_SITEURL` to your custom domain, e.g. `https://chat.example.com`.
   - Redeploy the `mattermost` service if necessary.
4. When the web service is **Live**, open the URL and finish initial setup wizard.

## Calls (voice/video)
- Install the **Mattermost Calls** plugin from **System Console → Plugin Management**.
- For calls behind NAT, set up a TURN server (e.g., coturn) and configure it in **System Console → Calls**.

## Environment variables
The entrypoint builds the database DSN from:
  - `DB_HOST`, `DB_PORT`, `DB_NAME`, `DB_USER`, `DB_PASSWORD`

You can add more overrides (any `MM_<Section><Setting>` env) in Render → Environment.
