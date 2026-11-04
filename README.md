# zagorkacompany.bg

Corporate site of Zagorka (Heineken Bulgaria). Ruby on Rails app with a RailsAdmin back office.

## Stack

| Component | Version |
|---|---|
| Ruby | 2.6.3 (via RVM, user `zagorkacompany`) |
| Rails | 5.2.8.1 |
| App server | Unicorn 5.4.1 |
| Database | SQLite (`shared/db/production.sqlite3`) |
| Admin | RailsAdmin 1.4.3 at `/site_admin` (HTTP Basic) |
| Uploads | Paperclip 6.0, CKEditor 4.2.4 |

Ruby 2.6 and Rails 5.2 are end-of-life. An upgrade to Ruby 3.x / Rails 7.x is planned separately.

## Production

- Server: VPS 185.123.188.98 (SuperHosting, Ubuntu 20.04, Docker).
- Request path: Nginx Proxy Manager (TLS) -> container `legacy-proxy-nginx-1` -> Unicorn socket
  `shared/tmp/sockets/.heinekenzagorkabrewery.sock`.
- Nginx config (host): `/etc/nginx-zagorkacompany/sites-available/heinekenzagorkabrewery.bg`.
  `/irregularity_signals/` is protected with HTTP Basic (`/etc/nginx-zagorkacompany/htpasswd-signals`).
- App path: `/home/zagorkacompany/heinekenzagorkabrewery.bg` (Capistrano layout: `releases/`, `shared/`, `current`).
- Outgoing mail: SMTP via `lava.superhosting.bg` (SuperHosting shared account `heineken`). Do not cancel that account.

## Secrets (not in git)

| File (on the server, in `shared/config/`) | Template |
|---|---|
| `admin.yml` - RailsAdmin / CKEditor / signals login | `config/admin.yml.example` |
| `app_secrets.yml` - SMTP and reCAPTCHA | `config/app_secrets.yml.example` |
| `master.key` - Rails credentials | - |

## Deploy (manual, until a new pipeline is set up)

```bash
sudo -iu zagorkacompany
cd ~/heinekenzagorkabrewery.bg
cp -a releases/<current> releases/<new>   # or check out this repo there
# update code, then in releases/<new>:
bundle install
RAILS_ENV=production bundle exec rails runner 'puts Rails.version'
ln -sfn ~/heinekenzagorkabrewery.bg/releases/<new> current
kill -USR2 $(cat shared/tmp/pids/unicorn.pid); sleep 15
kill -QUIT $(cat shared/tmp/pids/unicorn.pid.oldbin)
```

Rollback: point `current` back to the previous release and repeat the USR2/QUIT step.

`config/deploy.rb` and `bitbucket-pipelines.yml` still reference the previous vendor's repository and are not in use.

## Known issues

- Whistleblowing attachments are stored under `public/irregularity_signals/` inside the release directory.
  They should move outside `public/` and `releases/`, and be served only through the admin.
