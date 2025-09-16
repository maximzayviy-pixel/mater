# Mattermost on Render (Image mode)

This blueprint deploys Mattermost Team Edition directly from the official image,
avoiding custom Dockerfiles (no distroless shell issues). It also provisions a private
Postgres with a persistent disk.

## Deploy
1. Push this repo (just this `render.yaml`) to GitHub.
2. In Render: **New → Blueprint** → paste repo URL → Deploy.
3. After services are created:
   - Open **postgres → Environment**, copy `POSTGRES_PASSWORD`.
   - Open **mattermost → Environment**, set **DB_PASSWORD** to the same value → Save → Redeploy.
   - (Optional) Set `MM_SERVICESETTINGS_SITEURL` to your domain (e.g. `https://chat.example.com`).

## Calls
Enable **System Console → Plugins → Mattermost Calls**. For external users, configure a TURN server.
