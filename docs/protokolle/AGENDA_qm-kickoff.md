# Agenda: Team-Meeting „Arbeitsweise & Qualität“

| | |
|---|---|
| Datum / Uhrzeit | TT.MM.2026, HH:MM–HH:MM (75 min) |
| Ort | Google Meet – **Notizen-Funktion erst nach Zustimmung aller starten (TOP 1)** |
| Moderation | Rene (QM) |
| Vorbereitung | `QUALITY.md` und `docs/zielmatrix.md` überfliegen (10 min) |
| Ziel | Gemeinsame Spielregeln beschlossen, Owner verteilt, erste Aufgaben bis zum Q&A am 09.11. klar |

## TOP 1 – Start & Protokoll (5 min)
- **Beschluss B1:** Meet-Zusammenfassung als Rohprotokoll nutzen – alle stimmen der Transkription zu
- Ablauf: Schriftführung bearbeitet nach (≤ 24 h), Aufgaben werden Issues, Einspruchsfrist 48 h

## TOP 2 – Warum Qualitätsregeln? (5 min)
- Bewertet wird, was wir **nachweisen** – Berichte: Zielerreichung · Entscheidungen · Architektur · Verifikation · Reflexion
- Grundsatz: wenige Regeln, möglichst viel automatisch

## TOP 3 – Repo & Git-Workflow (15 min)
- Ein Monorepo auf GitHub (Struktur: `app/`, `infra/`, `monitoring/`, `tests/`, `docs/`)
- PR + 1 Review, Conventional Commits, Squash-Merge, `main` geschützt
- pre-commit: Demo (2 min), Einrichtung als Hausaufgabe
- **Beschluss B2:** Monorepo auf GitHub, Organisation: ______, Admins: ______
- **Beschluss B3:** Git-Regeln wie in `QUALITY.md` Abschnitt 1

## TOP 4 – Definition of Done & Dokumentation (10 min)
- DoD-Checkliste (steht in jeder PR-Vorlage)
- ADR = *warum* wir etwas entschieden haben · Runbook = *wie* man etwas bedient · Nachweise in `docs/evidence/`
- **Beschluss B4:** DoD wie in `QUALITY.md` Abschnitt 2

## TOP 5 – Zielmatrix & Owner (15 min)
- 11 Ziele, je ein Owner, Zielwerte vorerst vorläufig
- **Beschluss B5:** Owner-Verteilung

| Bereich | Ziele | Owner |
|---|---|---|
| Infrastruktur / IaC | 8 reproduzierbar, 11 kostenbewusst | |
| CI/CD / Container | 7 kontrolliert ausgeliefert, 2 performant | |
| Monitoring / Security | 9 beobachtbar, 5 sicher | |
| App / Daten | 6 datenschutzkonform, 4 wiederherstellbar | |
| QM | 10 dokumentiert + Gesamtmatrix | Rene |
| Stufe 3 (Verteilung im Dezember) | 1 elastisch, 3 hochverfügbar | |

- **Beschluss B6:** Zielwerte gelten vorläufig, endgültig nach Discovery Lab + Q&A

## TOP 6 – Quality Gate & Auslieferung (5 min)
- Interner Freeze jeweils Donnerstag vor der Abgabe, QM-Review bis Samstag
- Pipeline: Merge → Staging automatisch → Prod nur mit Freigabe
- **Beschluss B7:** Freeze-Termine 19.11. / 10.12. / 28.01.
- **Beschluss B8:** Prod-Freigabe durch ______ und ______

## TOP 7 – Rhythmus (5 min)
- **Beschluss B9:** Weekly jeden ______ um ______, Sprints à 2 Wochen

## TOP 8 – Aufgaben bis Q&A 09.11. (10 min)

| Aufgabe | Owner | Frist |
|---|---|---|
| GitHub-Organisation + Repo einrichten (Runbook `github-setup.md`) | | |
| QM-Paket als ersten PR einbringen | Rene | |
| Alle: pre-commit einrichten + Mini-PR (Name in README) | alle | |
| AIP-Server-Code nach `app/server/` importieren (mit Historie) | | |
| CloudStack Discovery Lab: Templates, Offerings, Quotas, Netz, LB/AutoScale → `docs/` | | |
| ADR-0002 Monorepo/GitHub, ADR-0003 Protokollprozess | | |
| Fragenliste an Betreuer vorab schicken | Gruppenmanagement | |

## TOP 9 – Fragen für das Q&A am 09.11. sammeln (5 min)
- Gewichtung: PDF und Kursübersicht widersprechen sich – was gilt?
- Haben VMs öffentliche IPs, ist SSH von außen (GitHub Actions) erreichbar?
- Quotas (vCPU, RAM, Storage, Anzahl VMs)?
- CloudStack Load Balancer und AutoScale verfügbar?
- Object Storage (S3-kompatibel) verfügbar, z. B. für Backups / Terraform-State?
- Domain und TLS-Zertifikate – gibt es Vorgaben?
- …

## Abschluss (Moderation)
Entscheidungen und Aufgaben **laut zusammenfassen**, damit sie sauber in der Meet-Zusammenfassung landen.
