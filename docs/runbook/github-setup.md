# Runbook: GitHub-Repo einrichten

| | |
|---|---|
| Owner | |
| Zuletzt getestet | YYYY-MM-DD von <Name> |
| Betroffene Ziele | 5 sicher, 7 kontrolliert ausgeliefert, 8 reproduzierbar |

## 1. Repo und Branch-Protection
Settings → Branches → Add rule (oder Rulesets) für `main`:
- [x] Require a pull request before merging → 1 Approval
- [x] Require status checks to pass → `pre-commit`, `secrets`, `test`, `build`
- [x] Do not allow bypassing the above settings
- [x] Block force pushes

## 2. Environments (Settings → Environments)

| Environment | Schutzregel | Secrets | Variables |
|---|---|---|---|
| `staging` | keine | `SSH_PRIVATE_KEY`, `SSH_HOST`, `SSH_USER`, `SSH_KNOWN_HOSTS`, `CLOUDSTACK_API_KEY`, `CLOUDSTACK_SECRET_KEY` | `HEALTH_URL`, `CLOUDSTACK_API_URL` |
| `production` | **Required reviewers**: 1–2 Personen (z. B. QM + Gruppenmanagement), *Prevent self-review* | wie staging, mit Prod-Werten | wie staging |

- `SSH_PRIVATE_KEY`: eigener Deploy-Key nur für die Pipeline (`ssh-keygen -t ed25519 -C deploy-staging`), Public Key auf der VM beim Deploy-User hinterlegen.
- `SSH_KNOWN_HOSTS`: Ausgabe von `ssh-keyscan <host>` (einmal prüfen, dass der Fingerprint stimmt).
- `HEALTH_URL`: z. B. `https://staging.<domain>/health`

## 3. Repository-Variable (optional)
`DEPLOY_RUNNER = self-hosted` – nur nötig, wenn GitHub-Runner die CloudStack-VMs nicht per SSH erreichen
(vorher testen!). Dann einen Self-hosted Runner auf einer kleinen VM in CloudStack registrieren
(Settings → Actions → Runners) und diese Entscheidung als ADR festhalten.

## 4. Packages (GHCR)
Das Image landet unter `ghcr.io/<org>/<repo>/labyrinth-server`. Die Pipeline meldet sich auf der VM
mit einem kurzlebigen Token an – kein dauerhaftes Passwort auf der VM nötig.

## 5. Ablauf der Pipeline

| Ereignis | Was passiert |
|---|---|
| Pull Request | pre-commit, gitleaks, Tests, Image-Build + Trivy-Scan, Terraform validate (bei Infra-Änderungen) |
| Merge auf `main` | zusätzlich: Image nach GHCR → Deploy Staging + Smoke-Test → wartet auf Freigabe → Deploy Prod + Smoke-Test |
| Manuell: `deploy` | Rollback/Deploy eines beliebigen Tags in staging oder production |
| Manuell: `infra` | Terraform plan/apply für eine Umgebung (production nur mit Freigabe) |

## 6. Rollback
1. Actions → `deploy` → Run workflow
2. Environment wählen, Image-Name und vorherigen Tag eintragen (steht auf der VM in `/opt/labyrinth/DEPLOYED_VERSION` bzw. in der Pipeline-Historie)
3. Prüfen: Smoke-Test grün, Grafana zeigt normale Fehlerrate

## Wenn etwas schiefgeht
| Symptom | Ursache | Lösung |
|---|---|---|
| `Host key verification failed` | `SSH_KNOWN_HOSTS` fehlt/falsch | `ssh-keyscan` neu ausführen, Secret aktualisieren |
| Deploy-Job hängt bei SSH / Timeout | VM von GitHub aus nicht erreichbar | Firewall prüfen oder Self-hosted Runner (Punkt 3) |
| `denied` beim `docker compose pull` | Package-Rechte | Package → Settings → Repo-Zugriff erlauben |
| Trivy bricht ab | kritische Lücke im Base-Image | Base-Image aktualisieren, nicht Scan abschalten |
