# TURN (coturn) on Render — TCP-only blueprint

⚠️ Render private services currently expose **TCP** ports. UDP isn't available,
so coturn will listen on TCP 3478. WebRTC will still work via TURN/TCP fallback,
though UDP would give lower latency (consider a VPS if you need UDP).

## Deploy
1) Push this repo to GitHub.
2) Render → New → Blueprint → Deploy.
3) Wait for **coturn** pserv to be Live. Copy its Service Address hostname.

## (Optional) Set EXTERNAL_IP
- Resolve the hostname to an IP (nslookup). Set EXTERNAL_IP in coturn → Environment.
- Manual Deploy coturn.

## Configure Mattermost Calls
- System Console → Plugins → Calls → ICE Servers Configurations → paste JSON below
  after replacing YOUR-COTURN-HOST with the coturn hostname (without :3478):

```json
[
  {
    "urls": [
      "turn:YOUR-COTURN-HOST:3478?transport=tcp"
    ],
    "username": "turnuser",
    "credential": "turnpass"
  },
  {
    "urls": [
      "stun:stun.l.google.com:19302"
    ]
  }
]
```

Save → Plugin Management → Disable/Enable **Mattermost Calls** → test a call.

## Notes
- Credentials: change TURN_USER / TURN_PASS to strong values and update Calls JSON.
- For best quality (UDP), deploy coturn on a VPS with UDP open and use that hostname.
