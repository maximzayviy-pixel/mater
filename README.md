# Mattermost on Render (fixed blueprint)

This blueprint wires Mattermost directly to the private Postgres using
`fromService.property: connectionString`, so you don't need to assemble the DSN manually.

## Deploy
1) Push this repo to GitHub.
2) In Render: New → Blueprint → paste repo URL → Deploy.
3) After creation:
   - (Optional) set `MM_SERVICESETTINGS_SITEURL` in the **mattermost** service to your domain.
   - Redeploy if you change env.
4) Open the Mattermost URL and complete the setup wizard.
5) Enable **System Console → Plugins → Mattermost Calls** for voice/video.
