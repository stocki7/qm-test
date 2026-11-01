# QM-Paket – Übersicht (Entwurf v0.1)

Diese Dateien gehören in das Root-Verzeichnis des Team-Repos.

| Datei | Zweck |
|---|---|
| `QUALITY.md` | Die Richtlinien (Git-Workflow, DoD, Checks, Doku, Quality Gate, Rollen) |
| `docs/zielmatrix.md` | 11 Ziele mit Owner, Zielwert-Vorschlag, Testmethode, Nachweis, Status |
| `docs/protokolle/README.md` + `VORLAGE.md` | Prozess: Google-Meet-Zusammenfassung → nachbearbeitetes Protokoll + Issues |
| `docs/adr/0000-vorlage.md`, `0001-adrs-verwenden.md` | ADR-Vorlage + erstes ADR als Beispiel |
| `docs/runbook/VORLAGE.md` | Runbook-Vorlage |
| `docs/evidence/README.md` | Benennungsregeln für Nachweise |
| `docs/qm/review-checkliste-abgabe.md` | Checkliste fürs Quality Gate vor jeder Abgabe |
| `docs/qm/qm-log.md` | Laufendes QM-Protokoll für die Reflexion |
| `.pre-commit-config.yaml` | Lokale automatische Checks |
| `.github/workflows/quality.yml` | Dieselben Checks + gitleaks in der CI (GitHub Actions) |
| `.github/workflows/pipeline.yml` | CI/CD: Test → Build + Trivy-Scan → GHCR → Staging → Freigabe → Prod |
| `.github/workflows/deploy.yml` | Wiederverwendbarer Deploy-Job per SSH + Docker Compose, manuell für Rollback |
| `.github/workflows/infra.yml` | Terraform validate bei PRs, plan/apply manuell |
| `infra/compose/docker-compose.yml`, `infra/terraform/envs/*/main.tf` | Grundgerüste mit TODOs |
| `docs/runbook/github-setup.md` | Einrichtung von Branch-Protection, Environments, Secrets, Rollback |
| `.github/pull_request_template.md` | PR-Vorlage mit DoD-Checkliste |
| `.gitignore` | Schützt vor versehentlichem Commit von Secrets/State |

**GitLab statt GitHub?** PR-Vorlage nach `.gitlab/merge_request_templates/Default.md` verschieben, CI als `.gitlab-ci.yml` umschreiben.

## Nächste Schritte
1. Entwurf im nächsten Weekly durchgehen (ca. 30 min), anpassen, beschließen
2. Ins Repo übernehmen, Branch-Protection für `main` aktivieren (1 Approval, CI muss grün sein)
3. Alle richten `pre-commit` ein
4. Owner für die 11 Ziele verteilen, Zielwerte beschließen
