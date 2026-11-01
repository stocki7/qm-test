# Qualitätsrichtlinien – Cloud Application Project

> Verantwortlich: Qualitätsmanagement (Rene) · Beschlossen am: `TT.MM.2026` · Version 0.1 (Entwurf)
>
> Grundsatz: **Wenige Regeln, die alle einhalten. Was eine Maschine prüfen kann, prüft die Maschine.**
> Änderungen an diesen Richtlinien laufen selbst per Pull Request und werden im Weekly kurz bestätigt.

## 1. Git-Workflow

| Regel | Details |
|---|---|
| `main` ist geschützt | Kein direkter Push. Änderungen nur per Pull Request (PR). |
| Branches | `feat/<kurzname>`, `fix/<kurzname>`, `docs/<kurzname>`, `infra/<kurzname>` |
| Commits | [Conventional Commits](https://www.conventionalcommits.org/de/): `feat:`, `fix:`, `docs:`, `infra:`, `test:`, `chore:` – wird per Hook geprüft |
| Review | Mind. **1 Approval** durch eine andere Person. Reviewer:innen rotieren (nicht immer QM). |
| Merge | Nur bei grüner CI. Squash-Merge, Branch danach löschen. |
| PR-Größe | Lieber klein und oft. Faustregel: in < 15 min reviewbar. |

## 2. Definition of Done (DoD)

Eine Aufgabe ist **fertig**, wenn:

- [ ] der PR reviewed und gemerged ist, CI ist grün
- [ ] keine Secrets im Code (gitleaks grün), Konfiguration über `.env` / Secret-Store
- [ ] Runbook bzw. README aktualisiert, falls sich Betrieb/Setup ändert
- [ ] bei einer Architektur- oder Tool-Entscheidung ein **ADR** in `docs/adr/` existiert
- [ ] der **Nachweis** (Screenshot, Log, Messwert) in `docs/evidence/` liegt und in der Zielmatrix verlinkt ist
- [ ] das Issue geschlossen ist

## 3. Automatische Prüfungen

Lokal per `pre-commit`, zusätzlich in der CI (`.github/workflows/quality.yml`):

| Werkzeug | Prüft |
|---|---|
| gitleaks | Secrets, Passwörter, API-Keys |
| pre-commit-hooks | Whitespace, Zeilenenden, YAML/JSON-Syntax, große Dateien, private Keys |
| hadolint | Dockerfiles |
| terraform fmt / tflint | Terraform-Code (IaC) |
| shellcheck | Shell-Skripte |
| conventional-pre-commit | Format der Commit-Message |

Einrichtung (einmalig pro Person):

```bash
pip install pre-commit
pre-commit install --hook-type pre-commit --hook-type commit-msg
pre-commit run --all-files   # erster Testlauf
```

## 4. Dokumentation

| Was | Wo | Vorlage |
|---|---|---|
| Architekturentscheidungen | `docs/adr/NNNN-titel.md` | `docs/adr/0000-vorlage.md` |
| Betrieb (Start, Stop, Deploy, Restore, Störung) | `docs/runbook/` | `docs/runbook/VORLAGE.md` |
| Besprechungsprotokolle | `docs/protokolle/` | siehe `docs/protokolle/README.md` (Google-Meet-Prozess) |
| Zielerreichung | `docs/zielmatrix.md` | – |
| Nachweise | `docs/evidence/` | Benennung siehe `docs/evidence/README.md` |

Sprache: Deutsch, Fachbegriffe englisch (Deployment, Load Balancer, …). Begriffe einheitlich verwenden.

## 5. Zielmatrix

`docs/zielmatrix.md` ist die zentrale Übersicht über die 11 Systemziele: Owner, Zielwert, Testmethode, Nachweis, Status.
Jede:r Owner hält ihre/seine Zeilen aktuell. QM prüft die Matrix wöchentlich und vor jeder Abgabe.

## 6. Quality Gate vor jeder Abgabe

| Abgabe | Interner Freeze | QM-Review bis | Offizielle Abgabe | Präsentation |
|---|---|---|---|---|
| Stufe 1 | Do 19.11.2026 | Sa 21.11.2026 | Mo 23.11.2026 | Do 26.11.2026 |
| Stufe 2 | Do 10.12.2026 | Sa 12.12.2026 | Mo 14.12.2026 | Do 17.12.2026 |
| Stufe 3 | Do 28.01.2027 | Sa 30.01.2027 | Mo 01.02.2027 | Do 04.02.2027 |

Ab dem Freeze: nur noch Bugfixes und Doku. QM prüft anhand von `docs/qm/review-checkliste-abgabe.md`.
Gefundene Mängel werden Issues mit Owner und Frist.

## 7. Rollen im Qualitätsprozess

| Rolle | Aufgabe |
|---|---|
| Qualitätsmanagement | Pflegt diese Richtlinien, Checks und Zielmatrix, führt Quality Gate durch, führt `docs/qm/qm-log.md` |
| Schriftführung | Sorgt dafür, dass jedes Meeting-Protokoll innerhalb von 24 h nachbearbeitet im Repo liegt |
| Alle | Halten DoD ein, reviewen PRs, liefern Nachweise für ihre Ziele |

## 8. Weekly – 5 Minuten Qualität

Fester Punkt im Weekly: Was lief gut? Wo hakt eine Regel? Offene Mängel aus dem Quality Gate?
