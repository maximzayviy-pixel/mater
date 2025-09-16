# Mattermost on Render — Literal DSN

Render doesn't substitute env vars inside values, and pservs don't expose a `connectionString` property.
Use a **literal** DSN and the same password in both services.

## Steps
1) Edit `render.yaml`:
   - Replace **__PASTE_SAME_PASSWORD__** in **both** places with the same strong password.
     - If the password contains special characters, **URL-encode** it in the DSN (e.g., `@` → `%40`, `:` → `%3A`, `/` → `%2F`, `?` → `%3F`, `#` → `%23`, `&` → `%26`).
2) Push to GitHub → Render → New → Blueprint → Deploy.
3) After deploy, open the Mattermost URL and go through the setup wizard.
4) Enable Calls in **System Console → Plugins → Mattermost Calls**.

## Example DSN
postgres://mmuser:MyStrongPass123%21@postgres:5432/mattermost?sslmode=disable&connect_timeout=10
(Note `%21` is `!`)
