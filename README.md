# ITCNE23-SEM-III - Relationale Datenbank / AWS RDS

## Einleitung
Diese Semesterarbeit konzentriert sich auf die Entwicklung eines Datenbankkonzepts für ein Warehouse Management System (WMS). Der Fokus liegt auf der Datenmodellierung und dem Datenschema, wobei nur der Backend-Teil implementiert wird. Das Datenbankschema soll mittels boto3 auf AWS deployed und die Datenbankinstanz mittels Prometheus überwacht werden.

**Datenmodellierung für WMS:** Die Herausforderung besteht darin, ein geeignetes Datenmodell zu entwerfen, das die Anforderungen an Benutzerverwaltung, Kundenverwaltung, Artikelverwaltung, Seriennummernverwaltung und Lieferscheinverwaltung erfüllt. Dabei müssen die Beziehungen zwischen den verschiedenen Entitäten berücksichtigt werden, um eine effiziente Datenverwaltung zu gewährleisten.

Auf basis des WMS soll ein Datenmodel für ein Warehouse System entworfen werden.

**Deployment in AWS mit IaC:** Die Semesterarbeit erfordert die Fähigkeit, das Datenbankkonzept mithilfe von Infrastructure as Code (IaC) in der AWS-Cloud bereitzustellen. Dies erfordert Kenntnisse in der Konfiguration von AWS-Ressourcen und -Diensten sowie in der Automatisierung von Bereitstellungsprozessen mittels Python-Skripten.

**Monitoring mit Prometheus:** Ein weiteres Ziel ist es, die Datenbank mittels Prometheus zu überwachen. Dies erfordert die Implementierung von Monitoring-Metriken, um Einblicke in den Zustand und die Leistung der Datenbank zu erhalten. Die Herausforderung besteht darin, relevante Metriken zu identifizieren und zu implementieren, um potenzielle Probleme frühzeitig zu erkennen und zu beheben.

**Backup-Strategie:** Die Entwicklung einer effektiven Backup-Strategie ist ebenfalls ein wichtiger Teil der Problemlösung. Dies beinhaltet die regelmässige Sicherung der Datenbank sowie die Implementierung von Wiederherstellungsmechanismen, um die Integrität und Verfügbarkeit der Daten im Falle eines Datenverlustes zu gewährleisten.

**Lifecycle Management:** Ein weiteres Ziel der Arbeit ist es, das Lifecycle-Management der Datenbank zu beschreiben und zu dokumentieren. Dies beinhaltet die Planung, Bereitstellung, Überwachung, Skalierung und Aktualisierung der Datenbankinstanzen im gesamten Lebenszyklus. 

Zusammenfassend soll die Semesterarbeit das Fachwissen vermitteln, um Datenbankkonzepte in die Praxis umzusetzen. Dies beinhaltet die Entwicklung eines geeigneten Datenmodells, die Bereitstellung der Datenbank in der Cloud, die Überwachung ihrer Leistung und Verfügbarkeit sowie die Implementierung einer zuverlässigen Backup-Strategie. Durch diesen praxisorientierten Ansatz möchte ich in der Lage sein, ähnliche Herausforderungen in meiner späteren beruflichen Tätigkeit erfolgreich zu meistern.

### Beispiel WMS Anforderung
Die Datenbank muss berücksichtigen, dass ein Kunde mehrere Bestellungen haben kann. Ein Auftrag besteht aus einem oder mehreren Artikeln, wobei für einige Artikel die Eingabe der Seriennummer erforderlich ist.
Damit der Auftrag an den Kunden ausgeliefert werden kann, muss er von einem Mitarbeiter bearbeitet werden. Dies beinhaltet die Kommissionierung der Artikel und die Eingabe der Seriennummer falls notwendig.

Ein konkretes Beispiel könnte wie folgt aussehen:
Mitarbeiter "X" bearbeitet den Auftrag des Kunden "Y". Der Auftrag enthält 2 Positionen mit unterschiedlichen Artikeln. Position 1 enthält 3 Stück des Artikels "xxx" und Position 2 enthält 2 Stück des Artikels "yyy". Der Artikel "yyy" ist seriennummerpflichtig, d.h. bei der Kommissionierung muss die Seriennummer des Artikels eingegeben werden. Die Artikel werden in einen Versandbehälter gelegt und dem Spediteur übergeben, der die Artikel an den Kunden liefert.

#### Beispiel Abwicklung Bestellung
Diese BPMN beschreibt den groben Ablauf der Auftragsabwicklung. Der Prozess Kunde/Spediteur ist nicht Bestandteil dieser Semesterarbeit und wurde daher nicht modelliert.

<img src="./bpmn/example_wms_diagram.svg">

### Übersicht Semesterarbeit

<img src="./bilder/Overview.drawio.svg">

## Projektmanagement
Die für diese Semesterarbeit gewählte Projektmanagementmethode ist Kanban, eine agile Arbeitsmethode, die darauf abzielt, Arbeitsprozesse zu visualisieren und den Arbeitsfluss effizient zu steuern. Diese Entscheidung basiert auf der Flexibilität und Anpassungsfähigkeit, die Kanban bietet.

Um die Semesterarbeit effektiv zu managen, wird sie in mehrere Iterationen (Sprints) unterteilt. Diese Sprints dienen dazu, den Arbeitsfortschritt zu verfolgen, klare Ziele für bestimmte Zeiträume zu setzen und regelmässige Reviews durchzuführen. Die Aufgaben werden priorisiert und in Kanban-Phasen wie "To-Do", "In Progress" und "Done" eingeteilt, um einen klaren Überblick über den Projektstatus zu gewährleisten. 

Für das gesamte Projektmanagement wird ein GitHub Project mit der Bezeichnung ITCNE23-SEM-III verwendet. GitHub Project ermöglicht ein integriertes und kollaboratives Management von Tasks, Issues und Milestones. Hier können nicht nur Kanban-Boards erstellt, sondern auch Fortschritte dokumentiert, Diskussionen geführt und notwendige Ressourcen bereitgestellt werden. Diese zentrale Plattform fördert die Zusammenarbeit und erleichtert die Nachverfolgung von Änderungen.

### Kanbanboard
Die Visualisierung der Arbeitsprozesse erfolgt über ein Kanban-Board, das als zentrales Instrument für das Projektmanagement fungiert. Dieses Board bietet nicht nur eine übersichtliche Darstellung aller Aufgaben, sondern zielt auch darauf ab, den Arbeitsfluss zu optimieren und die Gesamteffizienz des Projekts zu steigern.

Durch die konsequente Nutzung dieses Kanban-Boards können Engpässe und Bottlenecks im Arbeitsfluss schnell identifiziert werden, was zu einer effizienten Arbeitsweise führt.

Die effektive Anwendung dieses visuellen Instruments trägt wesentlich zum erfolgreichen Abschluss der Semesterarbeit bei und ermöglicht eine flexible Anpassung an sich verändernde Anforderungen während des gesamten Projektablaufs.

<img src="./bilder/Kanban-Board.svg">

### Roadmap
Die strategische Planung und Steuerung der Sprints erfolgt anhand einer detaillierten Roadmap, die wichtige Meilensteine enthält. Diese Meilensteine sind auf die einzelnen Sprints abgestimmt und dienen als Leitfaden für die Fortschrittskontrolle und den erfolgreichen Abschluss der Projektphasen.

| Datum | Sprint |
| --- | --- |
| 27.05.2024 | Ergebnis 1. Sprint |
| 17.06.2024 | Ergebnis 2. Sprint |
| 12.07.2024 | Ergebnis 3. Sprint / Abgabe / Präsentation |

<img src="./bilder/Roadmap.svg">

### Taskliste
Um die Verwaltung und Organisation der Aufgaben weiter zu optimieren, wird eine Taskliste erstellt. Diese dient dazu, Aufgaben zu erfassen, sie nach verschiedenen Kategorien zu filtern und zu gruppieren. Das Ziel ist, eine bessere Übersichtlichkeit und Strukturierung innerhalb des Projektmanagements zu gewährleisten.

Die Taskliste wird so gestaltet, dass jeder Task mit spezifischen Metadaten versehen werden kann, um eine einfache Zuordnung zu bestimmten Kategorien zu ermöglichen. 

<img src="./bilder/Taskliste.svg">

#### Task Kategorien
- Status
- Priority
- Milestones

#### Task Status
Das Kanbanboard wir in 4 Spalten aufgeteilt.
- Todo
- In Progress
- Done
- Backlog

#### Task Labels
Es werden folgende Labels verwendet um die Tasks nach Themen zu gruppieren.
- Doku  --> Task für die Dokumentation
- DB    --> Task für Datenbank
- IaC   --> Task für Infrastructure as Code
- AWS   --> Task für Amazon Web Services

### Stakeholder-Analyse
| Name | Rolle | Interesse | Einstellung | Einfluss |
|---------|---------|---------|---------|---------|
| Roger Blum  | Konzept / Projektmanagement / Entwicklung / Dokumentation / Präsentation  | Termingerechte Umsetzung, Erfüllung der Anforderungen  | Hoch | Kritisch | Optimistisch |
| Philipp Rohr  | Beratung Projektmanagement  | Projektkoordination und Erfolg | Mittel | Unterstützend |
| Thomas Kählin | Beratung Technische Umsetzung  | Technische Umsetzung Datenbank | Mittel | Unterstützend |
| Marcel Bernet | Kursleiter ITCNE-23  | Ausbildungserfolg der Studierenden | Niedrig | Neutral |

**Roger Blum**
Kategorie: Schlüsselspieler
Strategie: Regelmässige Updates, Kommunikation mit Dozenten, um sicherzustellen, dass die Anforderungen erfüllt werden und alle Projektschritte termingerecht umgesetzt werden. Auf kritischen Rückmeldungen eingehen und Lösungen anbieten.

**Thomas Kählin**
Kategorie: Unterstützer
Strategie: Unterstützung bei der technischen Umsetzung, Sicherstellung, dass er über alle technischen Anforderungen und Änderungen informiert ist.

**Philipp Rohr**
Kategorie: Unterstützer
Strategie: Einbindung in das Projektmanagement, klare Kommunikation der Projektziele und Fortschritte. Meetings zur Fortschrittsüberprüfung und zur Sicherstellung der kontinuierlichen Unterstützung.

**Marcel Bernet**
Kategorie: Beobachter
Strategie: Gelegentliche Updates und Informationen über den Projektfortschritt mit den Dozenten, um sicherzustellen, dass er über den Ausbildungsfortschritt informiert bleibt. Seine neutrale Einstellung durch Transparenz und Offenheit beibehalten.

### SEUSAG
#### Systemgrenze

<img src="./bilder/Systemgrenzen.drawio.svg">

#### Schnittstellen
| Schnittstelle | <div style="width:175px">Element</div> | Beschreibung |
|---------------|---------|-------------|
| S1 | AWS CLI / Phyton (boto3) | Um Datenbankressourcen in der AWS Cloud bereitzustellen, wird die AWS CLI / boto3 verwendet. |
| S2 | Phyton (boto3) / AWS Services | Mit Hilfe von boto3 wird der AWS-Datenbankservice entsprechend den Anforderungen konfiguriert. |
| S3 | AWS Services / MariaDB | Die MariaDB soll auf dem AWS RDS (Amazon Relational Database Service) zur Verfügung gestellt werden. |
| S4 | MariaDB / Entwickler | Der Entwickler sollte die Möglichkeit haben, auf die MariaDB zuzugreifen, um deren Ressourcen zu überprüfen bzw. um den Status zu überprüfen. |

#### Einflussgrössen

<img src="./bilder/Einflussgroessen.drawio.svg">

| Einflüsse | <div style="width:175px">Element</div> | Beschreibung |
|---------------|---------|-------------|
| E1 | Cloud Provider | Der Cloud Provider beeinflusst die Verfügbarkeit und Zuverlässigkeit der bereitgestellten Dienste. Ein zuverlässiger Provider mit einer stabilen Infrastruktur minimiert das Risiko von Ausfallzeiten und Unterbrechungen, die sich negativ auf die Semesterarbeit auswirken könnte. Die Möglichkeit der schnellen Skalierung von Ressourcen ist ein wesentlicher Vorteil von AWS, weshalb dieser Provider für die Semesterarbeit ausgewählt wurde. |
| E2 | Entwickler | Die Fähigkeit des Entwicklers, sich selbst zu organisieren, Prioritäten zu setzen und eigenverantwortlich zu arbeiten, beeinflusst seine Effizienz und die Qualität der Semesterarbeit. Dazu gehören auch die technischen Fähigkeiten und die Erfahrung des Entwicklers.  |
| E3 | Zeit  | Der Abgabetermin für die Semesterarbeit legt den Zeitrahmen fest, in dem alle Projektaktivitäten abgeschlossen sein müssen. Die zeitliche Begrenzung erfordert eine sorgfältige Priorisierung der Aufgaben und Aktivitäten. Kritische Aufgaben müssen identifiziert werden, um sicherzustellen, dass sie rechtzeitig abgeschlossen werden, während weniger wichtige Aufgaben zurückgestellt werden können. |
| E4 | Dozent | Der Dozent legt die Richtlinien und Erwartungen für die Semesterarbeit fest, einschliesslich des Umfangs, der Struktur, der Bewertungskriterien und der Abgabefristen. Das Einholen von Feedback und die Berücksichtigung der Bewertungskriterien des Dozenten haben hohe Priorität, um sicherzustellen, dass die Semesterarbeit den Anforderungen entspricht und erfolgreich abgeschlossen wird. |
| E5 | MySQL | MySQL ist ein relationales Datenbankmanagementsystem, das zur Speicherung und Verwaltung strukturierter Daten verwendet wird. In dieser Semesterarbeit wird MySQL als Datenbank für die Speicherung der Daten des Warehouse Management Systems (WMS) verwendet. |

#### Unter- bzw. Teilsysteme 

<img src="./bilder/Unter-Teilsystem.drawio.svg">

#### Analyse Teilsystem AWS Provider

##### AWS RDS
Amazon RDS (Relational Database Service) ist ein Managed Service von Amazon Web Services (AWS), der es ermöglicht, relationale Datenbanken in der Cloud zu erstellen, zu betreiben und zu skalieren, ohne sich um die zugrunde liegende Infrastruktur kümmern zu müssen. Mit Amazon RDS können Benutzer Datenbankinstanzen schnell bereitstellen, verwalten und skalieren.
Aus diesem Grund soll in dieser Semesterarbeit AWS RDS für den Betrieb von MariaDB verwendet werden.

##### Prometheus
Prometheus ist ein Open Source Überwachungs- und Alarmsystem. Es wurde entwickelt, um eine skalierbare und zuverlässige Lösung für die Überwachung von verteilten Systemen und Anwendungen bereitzustellen. Prometheus ermöglicht es, Metriken von verschiedenen Systemkomponenten zu sammeln, zu speichern, zu aggregieren, zu visualisieren und darauf basierende Alarme zu erstellen. Es soll in dieser Semesterarbeit für das Monitoring von MariaDB verwendet werden.

#### Analyse Teilsystem Entwicklungsumgebung
Eine gut konfigurierte Entwicklungsumgebung kann die Effizienz der Entwicklung erheblich verbessern. Eine reibungslose Integration von Entwicklungstools, eine gute Performance und eine benutzerfreundliche Benutzeroberfläche ermöglichen, sich auf das Wesentliche zu konzentrieren: die Entwicklung der Arbeit.
Die Auswahl der richtigen Werkzeuge und Funktionen in der Entwicklungsumgebung kann den Entwicklungsprozess erheblich unterstützen.
Das folgende physikalische Gerät mit dem folgenden Betriebssystem wird für die Semesterarbeit verwendet.

- Notebook:       DELL XPS
- Description:    Ubuntu 22.04.3 LTS

##### Analyse Untersysteme Entwicklungsumgebung
###### AWS CLI
AWS CLI (Amazon Web Services Command Line Interface) ist ein von Amazon Web Services bereitgestelltes Befehlszeilen-Tool zur Verwaltung von AWS-Ressourcen und zur Interaktion mit AWS-Diensten. Mit AWS CLI können Entwickler und Systemadministratoren AWS-Ressourcen über die Kommandozeile verwalten und automatisieren. 

###### boto3
boto3 ist das offizielle Software Development Kit (SDK) von AWS für die Python-Programmiersprache. Es bietet eine Sammlung von Python-Bibliotheken und Modulen, die es Entwicklern ermöglichen, auf die AWS-Dienste zuzugreifen und mit ihnen zu interagieren.
boto3 soll für die Konfiguration / Deployment von MariaDB in AWS RDS verwendet werden.

###### dBeaver
DBeaver ist eine Open-Source-Datenbankverwaltungssoftware, die für eine Vielzahl von Zwecken und Anwendungsfälle verwendet werden kann.
DBeaver soll verwendet werden, um die MariaDB Datenbank zu verwalten und Datenbankabfragen durchzuführen.

###### MySQL Workbench
MySQL Workbench ist eine visuelle integrierte Entwicklungsumgebung (IDE) für MySQL-Datenbanken. Sie bietet eine Vielzahl von Werkzeugen und Funktionen, um MySQL-Datenbanken effizient zu entwerfen, zu entwickeln, zu verwalten und zu überwachen. 
Es soll in dieser Semesterarbeit für den Entwurf des ERD verwendet werden.

#### Gemeinsamkeiten
- MySQL (Relationale Datenbanken)
- AWS Schnittstellen

### Ziele SMART
#### WMS
Ausarbeitung einer WMS Demo Konzept, welches anschliessend in ein Data Warehouse - Star Schema umgewandelt wird.
- Erstellung ERD für Warehouse Management System (WMS)
- Erstellung ERD für Data Warehouse (DWH)

#### Python (boto3) / IaC
Mittels Python (boto3) soll die WMS Datenbank auf AWS automatisiert erstellt werden.
Dazu wird ein Python Skripts erstellt, welche die folgenden Punkte abdeckt:
- Anlegen der MariaDB Instance auf AWS RDS
- Anlegen der MariaDB Tabellen und deren Abhängigkeiten auf der MariaDB Instances 

#### Prometheus
Einrichtung einer Überwachungslösung auf Basis von Prometheus, um die Leistung und Verfügbarkeit der WMS Datenbank sicherzustellen.
Es soll eine Prometheus Instanz zur Verfügung gestellt werden, welche die Metrics der WMS Datenbank beinhaltet. Diese sollte mindestens folgende Punkte beinhalten:
- Uptime der Datenbank

#### Lifecyclemanagement WMS
Das Lifecyclemanagement soll mit folgenden Punkten dokumentiert werden. 
- Installation / Konfiguration, 
- Überwachung, 
- Skalierung, 
- Sicherung / Wiederherstellung

### Risikoanalyse
Um mögliche Risiken zu identifizieren, die den Erfolg der Semesterarbeit gefährden könnten, wird eine Risikoanalyse durchgeführt. Ziel der Risikoanalyse ist es, Risiken zu identifizieren und zu bewerten, um geeignete Massnahmen zu deren Bewältigung zu ergreifen.

#### Kopfstandtechnik
Für die Risikoanalyse in dieser Semesterarbeit wird die Kopfstandtechnik angewendet. Bei der Kopfstandtechnik wird die eigentliche Kernfrage der Risikoidentifikation „auf den Kopf gestellt“. Die sich daraus ergebende ungewöhnliche Aufgabenstellung soll die Kreativität anregen, um auch unerwartete und unkonventionelle Überlegungen als Ergebnis zu erhalten.

##### Umgekehrte Frage
Wie kann man sicherstellen, dass die Umsetzung der Semesterarbeit scheitert?
Gesammelte Ideen:
- Unklare Anforderungen und Ziel
- Schlechte Kommunikation Studierende / Dozenten
- Nicht einhalten von Deadlines 
- Fehlende Dokumentation
- Unzureichende Testabdeckung
- Übermässige Komplexität in der Architektur.

##### Identifizierte Risiken
- Schlechte Kommunikation Studierende / Dozenten
- Nicht einhalten von Deadlines 
- Fehlende Dokumentation
- Unzureichende Testabdeckung
- Übermässige Komplexität in der Architektur

##### Risikomatrix
|<div style="width:175px">Risiko</div>| <div style="width:175px">Wahrscheinlichkeit</div> | <div style="width:175px">Auswirkung</div> | <div style="width:175px">Bewertung (W * A)</div> | <div style="width:175px">Gegenmassnahme</div> |
|---------------|---------------|---------------|---------------|---------------|
| Schlechte Kommunikation Studierende / Dozenten:<br><br>Verzögerungen und Fehler durch mangelnde Kommunikation und Zusammenarbeit. | Hoch | Mittel | 3*2 = 6 | Regelmässige Meetings, Kommunikationskanal MS Teams Channel für Semesterarbeit. |
| Nicht einhalten von Deadlines:<br><br>Verzögerungen, Semesterarbeit kann nicht termingerecht fertiggestellt werden. | Mittel | Hoch | 2*3 = 6 | Realistische Planung und kontinuierliches Monitoring des Fortschritts (Roadmap / Sprints). |
| Fehlende Dokumentation:<br><br>Wissensverlust und Schwierigkeiten bei der Wartung und Weiterentwicklung. | Mittel | Hoch | 2*3 = 6 | Erstellung und Pflege umfassender Dokumentation für Entwickler und Endbenutzer. |
| Fehler im Produkt, die erst nach dem Abschlusstermin der Semesterarbeit entdeckt werden. | Mittel | Hock | 2*3 = 6 | Umfassende Test-Cases erstellen. Fortlaufend Testen. |
| Übermässige Komplexität in der Architektur<br><br>Erhöhter Entwicklungsaufwand sowie Fehleranfälligkeit. | Niedrig | Mittel | 1*2 = 3 | Verwendung bewährter Architekturprinzipien un regelmässige Architekturbewertungen. |

<img src="./bilder/Risikomatrix.png">
Die Farben in der Heatmap repräsentieren die Bewertungsstufen (Wahrscheinlichkeit * Auswirkung), wobei eine höhere Bewertung auf ein höheres Risiko hinweist. Die Risiken mit den höchsten Bewertungen wurden mit geeigneten Gegenmassnahmen adressiert, um deren Auswirkungen zu minimieren.

### Sekundärdatenanalyse Datenbank Backup
Wie effektiv und zuverlässig sind die Backup- und Wiederherstellungsmechanismen von Amazon RDS.

#### Ziele
Bewertung der Zuverlässigkeit und Effizienz von Amazon RDS Backup-Mechanismen.

#### Datenquellen
##### AWS Documentation
Offizielle AWS-Dokumentation und Whitepapers über RDS Backups und Snapshots.

##### Technische Blogs und Fachartikel
**Vorteile**
AWS RDS erlaubt die einfache und effiziente Bereitstellung von Datenbanken mit hoher Ausfallsicherheit, Skalierbarkeit und Sicherheit, ohne dass eine Serververwaltung notwendig ist. Mit RDS können neue Datenbanken mühelos erstellt, Replikate in einer Multi-Availability Zone angelegt und Backups durchgeführt werden.
Für die Einrichtung der Datenbank sind nur minimale Kenntnisse oder Zeit erforderlich. Alles, was Sie brauchen, ist im Grunde vorhanden. Die Dokumentation ist fantastisch.

**Nachteile**
Wenn Sie sich mit RDS nicht gut auskennen, können Sie keine effektiven Fehlertests durchführen, wenn ein Problem auftritt.
Den zugewiesenen Speicherplatz in Amazon RDS können Sie nur erhöhen, aber nicht reduzieren.

#### Ergebnisse
##### Zuverlässigkeit und Effizienz
Amazon RDS bietet automatische tägliche Backups und manuelle Snapshots, die als zuverlässig und einfach zu handhaben bewertet werden.
Im Vergleich zu herkömmlichen On-Premise-Systemen reduziert RDS die manuelle Arbeit und das Risiko von Backup-Fehlern erheblich.

##### Benutzerzufriedenheit
Nutzerberichte zeigen eine hohe Zufriedenheit mit der Zuverlässigkeit und Benutzerfreundlichkeit der RDS-Backups.
Einige Nutzer bemängeln die zusätzlichen Kosten für grosse Datenvolumen und die Komplexität bei der Wiederherstellung sehr grosser Datenbanken.

##### Vergleich mit anderen Systemen
In Benchmarks zeigt RDS eine ähnliche oder bessere Performance bei Backups im Vergleich zu anderen Cloud-Anbietern wie Google Cloud SQL und Microsoft Azure SQL Database.
On-Premise-Systeme benötigen oft mehr administrative Ressourcen und sind anfälliger für menschliche Fehler.

#### Zusammenfassung
Die Sekundärdatenanalyse zeigt, dass Amazon RDS eine zuverlässige und effiziente Lösung für Datenbankbackups bietet. Die Kombination aus automatischen Backups, manuellen Snapshots und wettbewerbsfähigen Kosten macht RDS zu einer attraktiven Option für viele Unternehmen. Trotz einiger Nachteile bei grossen Datenmengen überwiegen die Vorteile, insbesondere im Vergleich zu traditionellen On-Premise-Lösungen.

#### Quellenangaben
- [AWS RDS Documentation](https://docs.aws.amazon.com/rds/)
- [opstree](https://opstree.com/blog/2023/12/19/mastering-aws-rds-backups-navigating-encryption-challenges-with-aws-key-management-service-kms/)
- [Computerweekly](https://www.computerweekly.com/de/tipp/Vergleich-Cloud-Datenbanken-AWS-Microsoft-Google-Oracle)
- [Softwareadvice](https://www.softwareadvice.ch/reviews/425208/amazon-rds)
- [Capterra](https://www.capterra.ch/reviews/192201/amazon-rds)
- [Linkedin](https://www.linkedin.com/pulse/how-ensure-aws-rds-database-backups-remain-usable-steve-kinsman)

#### Entscheidung
Basierend auf den gesammelten Informationen und den Tests der AWS-Standard-Backups sowie der manuellen Snapshots habe ich folgende Backup-Strategie gewählt:

- Automatisiertes Backup beim Anlegen der MariaDB-Instanzen (Standardfunktion von AWS)
- Tägliches automatisiertes Backup der MariaDB-Instanzen (Standardfunktion von AWS)
- Skript zur Erstellung manueller Snapshots (boto3)
- Skript zur Wiederherstellung des letzten manuellen Snapshots (boto3)
- Skript für Point in Time Restore (boto3)

Das Standard-Backup von AWS wird automatisch beim Anlegen der Instanzen erstellt und täglich wiederholt. Dabei besteht die Möglichkeit, ein bestimmtes Zeitfenster für die Backups festzulegen, auf das ich jedoch verzichtet habe. 
Die automatisierten Backups haben den Vorteil, dass keine zusätzliche Konfiguration erforderlich ist, es sei denn, sie sollen deaktiviert werden. Da sie zum AWS-Standard gehören, entsteht kein zusätzlicher Aufwand. Auch die Wiederherstellung ist einfach und kann schnell über die AWS-Konsole durchgeführt werden.

Ich habe mich für manuelle Snapshots entschieden, da es Situationen geben kann (z.B. Releases oder Fehleranalysen), in denen kurzfristig ein Snapshot erforderlich ist. Diese Anforderung lässt sich ebenfalls einfach und schnell mit boto3 umsetzen.

Es hat mich überrascht, wie einfach und zuverlässig die AWS-Backups funktionieren.

Folgende Backup Scripts wurden erstellt:
- ![create_rds_snapshot.py](./python/create_rds_snapshot.py)
- ![delete_manual_snapshots.py](./python/delete_manual_snapshots.py)
- ![python/restore_latest_manual_snapshot.py](./python/restore_latest_manual_snapshot.py)
- ![restore_point_in_time_database.py](./python/restore_point_in_time_database.py)
- ![delete_rds_instance_restore.py.py](./python/delete_rds_instance_restore.py.py)

## Umsetzung
### Installation
#### Python
Für die Semesterarbeit wird die vorinstallierte Python Version 3.10.12 von Ubuntu 22.04 verwendet.
Es ist keine zusätzliche Installation notwendig.

[python.org](https://wiki.python.org/moin/BeginnersGuide/Download)

Folgende Packages werden zusätzlich benötigt:
- [pymysql](https://pypi.org/project/pymysql/) 
- [os](https://docs.python.org/3/library/os.html)
- [configparser](https://docs.python.org/3/library/configparser.html#)

##### Boto3
Boto3 wurde gemäss folgender Anleitung installiert (Version 1.34.46).

[Install Boto3](https://boto3.amazonaws.com/v1/documentation/api/latest/guide/quickstart.html#installation)

#### AWS CLI
AWS CLI wurde gemäss der offiziellen AWS Linux Installationsanleitung installiert (Version 2.15.22).

[Install AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html#cliv2-linux-install)

[python.org](https://wiki.python.org/moin/BeginnersGuide/Download)

#### Docker / Podman
Für das lokale Testing wird Docker / Podman verwendet.

[Docker](https://docs.docker.com/engine/install/ubuntu/)
[Podman](https://podman.io/docs/installation)

#### MariaDB
Für das lokale Testing wird das offizielle DockerHub Image von Maria DB verwendet.

[Docker hub - MariaDB](https://hub.docker.com/_/mariadb)

Der Container wird mit folgendem Compose File erstellt:

[MariaDB Podman Compose](./mysql/compose.yml)

Start Container
```
podman compose up -d
```

##### MariaDB-Client
Für das Testen der Verbindung zur AWS RDS MariaDB Instanz wurde MariaDB-Client gemäss AWS Dokumentation installiert.

[MariaDB-Client](https://docs.aws.amazon.com/de_de/AmazonRDS/latest/UserGuide/USER_ConnectToMariaDBInstance.html)

```
# Installation
sudo apt install mariadb-client

# Verbindung
mysql -h "Endpoint-URL" -P 3306 -u "Username" -p

```

#### MySQL Workbench
Die Installation von MySQL Workbench erfolgte gemäss der offiziellen Anleitung der MySQL Community für Linux (Version 8.0.36)

[Install MySQL](https://dev.mysql.com/doc/workbench/en/wb-installing-linux.html#wb-installing-linux-requirements)

```
sudo apt-get install mysql-workbench-community
```

#### dBeaver
Die Installation von dBeaver erfolgte gemäss der offiziellen Anleitung der DBeaver Community für Linux(Version 23.0.5).

[DBeaver Community](https://dbeaver.io/download/)

#### Visual Code Studio
Die Installation von Visual Code Studio erfolgte gemäss der offiziellen Anleitung von Visual Studio Code für Linux (Version 1.89.1)

[Install Visualstudio](https://code.visualstudio.com/docs/setup/linux)

#### Draw.io
Die Installation von Draw.io erfolgte gemäss der offiziellen Anleitung von Snapcraft (Version 24.4.0).

[Install Draw.io](https://snapcraft.io/install/drawio/ubuntu)

#### BPMN
Für BPMN wird die online Version verwendet, es ist keine lokale Installation notwendig.

[BPMN](https://demo.bpmn.io/new)

#### PlantUML
Für die automatisierte Aufbereitung des Sequenzdiagramm der Prometheus EC2 Instanz in github, wird PlantUML verwenden.

Setup für das Rendern:
[render-plantuml.yml](https://github.com/blro-ep/ITCNE23-SEM-III/blob/main/.github/workflows/render-plantuml.yml)

Setup für die Grafik:
[Sequenzdiagramm.puml](./Sequenzdiagramm.puml)

Berechtigungen auf Git Repository:
Seeting --> Actions --> General --> Workflow Permission == Read and write permissions 

#### Bandit
Bandit ist ein Werkzeug zum Auffinden allgemeiner Sicherheitsprobleme in Python-Code (SAST - Static Application Security Testing).
Um den Python-Code automatisiert zu prüfen, wurde dies als Github Workflow auf dem Repository der Semesterarbeit eingerichtet.
Wird eine Schwachstelle gefunden, wird eine E-Mail an die in Github hinterlegte E-Mail-Adresse gesendet.

[bandit-analysis.yml](https://github.com/blro-ep/ITCNE23-SEM-III/blob/main/.github/workflows/bandit-analysis.yml)

### Warehouse Management System (WMS)
Ein Warehouse Management System (WMS) ist eine Softwarelösung, die zur Verwaltung und Optimierung von Lagerbeständen und Lagerprozessen in einem Lager oder Distributionszentrum eingesetzt wird.
Mit dieser Semesterarbeit wird das Datenmodel von einem WMS erstellt. Diese Struktur ermöglicht es, Lagerprozesse wie Bestandsführung, Kommissionierung, und Kundenaufträge verwalten und zu verfolgen.

In dieser Semesterarbeit wird MariaDB eingesetzt, welches ein relationales Datenbankmanagementsystem (RDBMS) ist. MariaDB ist vollständig frei und offen zugänglich.

Das Datenmodel beinhaltet folgende Tabellen:

**Artikel:** 
Enthält Informationen über die Artikel im Lager.

**Behaelter:** 
Repräsentiert Behälter, in denen Artikel gelagert werden.

**Behaelter-Position:** 
Verknüpft Behälter mit Lieferscheinpositionen.

**Benutzer:** 
Enthält Benutzerinformationen.

**Kunde:** 
Enthält Informationen über Kunden.

**Lagerplatz:** 
Verwalten von Lagerplätzen und deren Bestand.

**Lieferschein:** 
Repräsentiert Lieferscheine.

**Lieferschein_position:** 
Enthält Positionen der Lieferscheine.

**Seriennummer:** 
Enthält Seriennummern für Artikelpositionen in Lieferscheinen.

**Statuscode:** 
Definiert verschiedene Statuscodes.

#### Entity-Relationship-Diagramm
Das Entity-Relationship-Diagramm (ERD) ist ein grafisches Modell, das die Datenstruktur des WMS beschreibt. Es zeigt, wie die verschiedenen Elemente (Entitäten) des Systems miteinander in Beziehung stehen (Beziehungen).
Es bietet eine leicht verständliche visuelle Darstellung der Datenbankstruktur, die bei der Planung und dem Design der Datenbank vor der Implementierung hilft.

- ![WMS ERD](./bilder/wms-erd.png)

#### MariaDB-Dump
Aus dem ERD wird ein MariaDB Dump erstellt, welcher später für den Import in AWS RDS verwendet wird.

- ![dump-wms.sql](./python/dump-wms.sql)

#### Data Warehouse (DWH)
Im Rahmen der Semesterarbeit soll ein aus dem WMS abgeleitetes DWH erstellt werden.
Ziel dieser Überführung ist eine für Abfragen und Analysen optimierte Datenbank.
Dies ermöglicht einen tieferen Einblick in die Geschäftsdaten und das Erkennen von Mustern und Trends.

**OLTP:** Warehouse Management System (WMS)
**OLAP:** Data Warehouse (DWH)

| **Merkmal**          | **OLTP (Online Transaction Processing)** | **OLAP (Online Analytical Processing)**  |
|----------------------|-----------------------------------------|-----------------------------------------|
| **Zweck**            | Verarbeitung von täglichen Transaktionen | Durchführung von Datenanalysen          |
| **Operationen**      | Einfache Transaktionen (Einfügen, Aktualisieren, Löschen) | Komplexe Abfragen und Analysen          |
| **Benutzeranzahl**   | Viele gleichzeitige Benutzer            | Wenige Benutzer                         |
| **Datenmenge**       | Viele kleine Transaktionen              | Grosse Datenmengen, oft historisch       |
| **Datenstruktur**    | Stark normalisiert (wenig Redundanz)    | Denormalisiert (mehr Redundanz)         |
| **Reaktionszeit**    | Sehr schnell                             | Kann länger dauern                      |
| **Beispiele**        | Banken, Einzelhandel, Buchungssysteme   | Business Intelligence, Berichterstattung |

##### Star Schema 
Das Data Warehouses wird nach einer standardisierten Form entworfen, die als Star Schema bezeichnet wird. Das Star Schema erhielt seinen Namen, weil es aus zwei Hauptkomponenten besteht: einer Faktentabelle in der Mitte des logischen Diagramms des Schemas, die mit mehreren Dimensionstabellen verbunden ist. 

![dwh-erd.png](./bilder/dwh-erd.png)

**Faktentabellen**  
In der Faktentabelle werden alle Ereignisse (Fakten) gespeichert. Bei diesen Ereignissen kann es sich um beliebige Beobachtungen handeln, die wir in möglichst granulärer Form speichern wollen.

- lieferschein

**Dimensionstabellen**
Die Dimensionstabellen beschreiben die Geschäftseinheiten, z.B. Kunden, Produkte, Zeit.

 - kunde
 - artikel
 - behaelter
 - benutzer
 - datum
 - statuscode

##### Auswertungen
| Auswertung | Nutzen |
|---|---|
| Welcher Artikel wurde vom Kunden X am häufigsten bestellt | Werbung für ähnliche Produkte, Rabatte bei grösseren Bestellmengen |
| Wie viele Behälter hat ein Kunde durchschnittlich pro Bestellung | Ladungsträgeroptimierung, eventuell Verdichtung der Auslieferung |
| Welcher Artikel wurde am meisten ausgeliefert | Lagerplatzoptimierung, kurze Wege für die Kommissionierung |
| Was ist das Gesamtgewicht einer Bestellung | Optimierung der Frachtkosten, Überprüfung der Spediteur Kosten |
| Was ist das durchschnittliche Gewicht einer Bestellung | Optimierung der Kommissionierung und Arbeitsprozesse |
| Wie viele Lieferscheine verarbeitet Benutzer X durchschnittlich pro Tag | Optimierung der Logistik Abläufe |

### IaC Deployment
Mit Boto3 (Python) soll die Bereitstellung der MariaDB-Instanzen auf AWS RDS automatisiert werden. Dies umfasst die automatische Bereitstellung der notwendigen Datenbanken für das Warehouse Management System (WMS) und das Data Warehouse (DWH) auf AWS RDS. Zusätzlich soll eine automatisierte Backup Lösung entwickelt werden, um die Sicherung und Wiederherstellung der Datenbanken zu gewährleisten.

#### Security Python
Um den Python-Code auf Sicherheitsprobleme zu überprüfen, habe ich mich für Bandit AST entschieden, das über Github als CI/DD Pipeline eingebunden wird.

Bandit AST bezieht sich in der Regel auf "Bandit Abstract Syntax Tree", ein Werkzeug, das in Python zur Durchführung AST-basierter Sicherheitsanalysen verwendet wird. Es hilft bei der Erkennung allgemeiner Sicherheitsprobleme in Python-Code, indem es den Code in einen abstrakten Syntaxbaum (AST) zerlegt und dann verschiedene Prüfungen durchführt, um Schwachstellen wie potenzielle Code-Injektion, unsachgemässe Eingabevalidierung und andere Sicherheitsrisiken zu erkennen.

- **Abstract Syntax Tree (AST):** Python-Code wird in einen AST geparst, der die Struktur des Codes darstellt, ohne notwendigerweise die tatsächliche zeilenweise Ausführung widerzuspiegeln.

- **Security Analysis:** Bandit analysiert dieses AST, um Muster zu erkennen, die auf Sicherheitsschwachstellen hinweisen könnten.

- **Types of Vulnerabilities:** Es prüft auf Probleme wie hart kodierte Passwörter, SQL-Injection-Schwachstellen, Cross-Site-Scripting-Risiken (XSS), falsche Dateiberechtigungen und vieles mehr.

#### AWS RDS Instances
Folgende Scripts wurden für AWS RDS Instances erstellt:
- ![create_rds_instances.py](./python/create_rds_instances.py)
- ![delete_rds_instances.py](./python/delete_rds_instances.py)
- ![list_rds_instances.py](./python/list_rds_instances.py)
- ![get_rds_instances_endpoint.py](./python/get_rds_instances_endpoint.py)

#### AWS RDS Snapshot
Folgende Scripts wurden für AWS RDS Snapshot erstellt:
- ![create_rds_snapshot.py](./python/create_rds_snapshot.py)
- ![delete_manual_snapshots.py](./python/delete_manual_snapshots.py)
- ![list_rds_snapshots.py](./python/list_rds_snapshots.py)
- ![restore_latest_manual_snapshot.py](./python/restore_latest_manual_snapshot.py)

#### Import Database Script
Folgender Script wurde für den Import der Datenbank erstellt:
- ![import_dump-wms.py](./python/import_dum-wms.py)

### Prometheus
Die RDS Instance soll mittels Prometheus überwacht werden.
Da AWS RDS keine Prometheus Metrics zur Verfügung stellt, wird dies mittels prometheus-rds-exporter sichergestellt.

#### EC2 Instances
Die Installation des prometheus-rds-exporter erfolgt auf einer AWS EC2 Instanz (Ubuntu 24.04).
Die Installation kann mittels Python Script automatisch hochgefahren werden.

Im folgenden Skript sind die Details zur automatisierten Erstellung mittels Python (boto3):
- ![create_ec2_instances_prometheus_rds_exporter.py](./python/create_ec2_instances_prometheus_rds_exporter.py)

#### Prometheus RDS Exporter 
Die Installation des prometheus-rds-exporter erfolgt auf einer AWS EC2 Instanz (Ubuntu 24.04).
Der Quellcode ist unter folgendem Link verfügbar:
- ![prometheus-rds-exporter](https://github.com/qonto/prometheus-rds-exporter)

Die Installation des Exporters erfolgt über UserData (runcmd). Der Exporter wird beim Erstellen der EC2-Instanz installiert.

Im folgenden Skripts sind die Details zur automatisierten Erstellung mittels Python (boto3):
- ![create_ec2_instances_prometheus_rds_exporter.py](./python/create_ec2_instances_prometheus_rds_exporter.py)

#### Prometheus Node Exporter
Die Installation des prometheus-rds-exporter erfolgt auf einer AWS EC2 Instanz (Ubuntu 24.04).
Der Quellcode ist unter folgendem Link verfügbar:
-![prometheus-node_exporter](https://github.com/prometheus/node_exporter)

Die Installation des Exporters erfolgt über UserData (runcmd). Der Exporter wird beim Erstellen der EC2-Instanz installiert.

Im folgenden Skripts sind die Details zur automatisierten Erstellung mittels Python (boto3):
- ![create_ec2_instances_prometheus_rds_exporter.py](./python/create_ec2_instances_prometheus_rds_exporter.py)


#### IAM Berechtigungen
Damit der Prometheus Exporter auf die Log Daten von AWS RDS zugreifen kann, muss die EC2 Instance entsprechend berechtigt werden. Dafür muss eine entsprechende IMA Policy / Role / Instance Profile vorhanden sein. 

In folgenden Skripts sind die Details zur automatisierten Erstellung mittels Python (boto3):
- ![create_iam_policy.py](./python/create_iam_policy.py)
- ![create_iam_role.py](./python/create_iam_role.py)
- ![create_iam_instances_profile.py](./python/create_iam_instances_profile.py)

#### Prometheus
Prometheus wird als Podman Container auf der EC2 Instanz bereitgestellt.
Dieser erhält die Metriken vom prometheus-rds-exporter.

Prometheus wird über Podman Compose mit der Erstellung der EC2 Instanzen gestartet (UserData).
Der Start erfolgt über Podman Compose.

![Prometheus](./diagrams/Prometheus.png)

Die Installation von Podman / Podman Compose sowie das Starten des Container sind in folgendem Script.
- [create_ec2_instances_prometheus_rds_exporter.py](./python/create_ec2_instances_prometheus_rds_exporter.py)

Die Einstellungen von Podman Compose sind in folgendem File.
- [podman-compose.yml](./podman/podman-compose.yml)

Die Target IP Adresse für Prometheus wird mit folgendem Script ebenfalls mittels UserData gesetzt.
- [setPublicIP.sh](./bash/setPublicIP.sh)

Prometheus ist nach dem Deployment der EC2 Instance via Web über die Public IP auf dem Port 9090 erreichbar.

#### Grafana
Grafana wird als Podman Container auf der EC2 Instanz bereitgestellt.

Grafana wird über Podman Compose mit der Erstellung der EC2 Instanzen gestartet (UserData).
Der Start erfolgt über Podman Compose.

![Grafana](./diagrams/Grafana.png)

Die Installation von Podman / Podman Compose sowie das Starten des Container sind in folgendem Script.
- [create_ec2_instances_prometheus_rds_exporter.py](./python/create_ec2_instances_prometheus_rds_exporter.py)

Die Einstellungen von Podman Compose sind in folgendem File.
- [podman-compose.yml](./podman/podman-compose.yml)

Die Target IP Adresse für Prometheus wird mit folgendem Script ebenfalls mittels UserData gesetzt.
- [setPublicIP.sh](./bash/setPublicIP.sh)

Grafana ist nach dem Deployment der EC2 Instance via Web über die Public IP auf dem Port 3000 erreichbar.

#### Sequenzdiagramm Prometheus EC2 Instance
In folgendem Sequenzdiagramm ist der grobe Ablauf der EC2 Prometheus Instance beschrieben.

![Sequenzdiagramm.png](./diagrams/Sequenzdiagramm_Prometheus%20_EC2.png)

- Benutzer -> EC2: Erstellen der EC2-Instanz
Der Benutzer initiiert die Erstellung einer EC2-Instanz mittle Python Script.
Wie Userdata werden folgende Steps ausgeführt

- EC2 -> Git: Klonen des Git Repos
Die EC2-Instanz klont das Git-Repository [github.com/blro-ep/ITCNE23-SEM-III](https://github.com/blro-ep/ITCNE23-SEM-III).

- Git -> Script: Start Scripts IP Config Prometheus
Es wird ein Script aus dem Git-Repository gestartet, welches die interne IPv4 der EC2 Instance in der Prometheus Konfiguration setzt.

- Script -> Exporter: Download und Install RDS Exporter
Prometheus RDS Exporter als .deb Paket herunterladen und installieren.

- Exporter -> Podman: Starten Podman Compose für Prometheus
Der Prometheus-Container wird mit Hilfe von Podman Compose gestartet.

### Portmatix
Folgende Ports müssen auf der Security Group konfiguriert werden.
Für die Semesterarbeit wurde die AWS RDS / EC2 die selbe Security Group verwendet.

| Port | Rule | Protokoll | Type | 
|---|---|---|---|
| 22 | Inbound | TCP | SSH |
| 3000 | Inbound | TCP | Grafana |
| 3306 | Inbound | TCP | MariaDB |
| 9090 | Inbound | TCP | Prometheus |

### Lifecyclemanagement WMS / RDS

#### Planung Datenbank
Die Datenbank sollte eine klar definierte Struktur durch Tabellen mit vordefinierten Schemata bieten, was die Verwaltung und Konsistenz der Daten erleichtert.
Die Datenbank soll ACID (Atomicity, Consistency, Isolation, Durability) unterstützen, um sicherzustellen, dass Transaktionen entweder vollständig oder gar nicht ausgeführt werden, was für die Datenintegrität unerlässlich ist.
Um die Kosten zu optimieren, soll eine Open Source Datenbank verwendet werden, die von einer aktiven Community unterstützt wird, die regelmässig Updates und Sicherheitspatches zur Verfügung stellt.
Die Datenbank sollte sowohl vertikale als auch horizontale Skalierungsmöglichkeiten bieten.

Nach sorgfältiger Abwägung der Anforderungen wurde MariaDB als die optimale Lösung identifiziert. 
MariaDB stellt eine robuste und leistungsfähige Alternative zu MySQL und anderen relationalen Datenbanken dar, die sich sowohl für kleine als auch für grosse Anwendungen eignet. Insbesondere bei Anwendungen, bei denen Skalierbarkeit, Kompatibilität und Performance von grosser Bedeutung sind, bietet MariaDB eine zuverlässige Lösung.

Die Datenbank wird auf AWS RDS betrieben, um eine einfache Verwaltung zu gewährleisten. AWS RDS übernimmt Routineaufgaben wie Hardware-Provisionierung, Datenbankeinrichtung, Patching und Backups. Mit AWS RDS können Datenbankinstanzen schnell und einfach skaliert werden, sowohl vertikal (durch Erhöhung der Instanzgrösse) als auch horizontal (durch Multi-AZ-Deployment oder Lesereplikationen). 

#### Installation / Konfiguration
Die Installation der AWS RDS Instance erfolgt mittels boto3-Skript. Nach der Ausführung des Skripts steht die AWS RDS MariaDB nach ungefähr fünf Minuten zur Verfügung. Die wichtigsten Informationen können per config.ini zentral definiert werden.

![AWD RDS MariaDB erstellen](./python/create_rds_instances.py)
![AWS RDS Parameter Config](./python/config.ini)

Die AWS RDS-Instanz ist über die EndPoint-URL bzw. den entsprechenden Port erreichbar.
Die entsprechenden Informationen können in der AWS RDS Console eingesehen werden. Alternativ steht ein Skript zur Verfügung, mit dem die Daten abgefragt werden können.

![AWS RDS Endpoint Informationen](./python/get_rds_instances_endpoint.py)

#### Überwachung
Die Überwachung der AWS RDS Instanz erfolgt mittels Prometheus, welches in einer AWS EC2 Instanz zur Verfügung steht. Die Metrics von AWS RDS werden mittels [prometheus-rds-exporter](https://github.com/qonto/prometheus-rds-exporter) zur Verfügung gestellt. Dieser wandelt die AWS CloudWatch Daten in Prometheus Metrics um, welche mittels Promql abgefragt werden können.

In Prometheus wurden folgende Alert Rules definiert, um mögliche Probleme zu erkennen.

| Alert Name | Beschreibung |
|---|---|
| AWS RDS NoDataAlert | Dieser Alert wird ausgelöst, wenn keine AWS RDS Instanz mit dem Status "Available" verfügbar ist. |
| AWS RDS Exporter InstanceDown | Dieser Alert wird ausgelöst, wenn der prometheus-rds-exporter von Prometheus nicht erreicht werden kann. |
| AWS RDS Exporter Errors | Dieser Alert wird ausgelöst, wenn der prometheus-rds-exporter Fehler liefert.
| AWS RDS DB sem-3-db-instance is down | Dieser Alert wird ausgelöst, wenn kein AWS RDS DB-Identifier mit dem Namen "sem-3-db-instance" existiert. |
| AWS RDS Instance Pending Maintenance | Dieser Alert wird ausgelöst, wenn Wartungsarbeiten von AWS an Software oder Hardware anstehen. |
| AWS EC2 Prometheus Node Exporter Down | Dieser Alert wird ausgelöst, wenn der Prometheus Node Exporter der EC2 Instanz nicht erreichbar ist. |

#### Skalierung 

Vergleichstabelle  Vertikale- / Horizontale Skalierung

| **Kriterium** | **Vertikale Skalierung** | **Horizontale Skalierung** |
|---|---|---|
| **Definition** | Erhöhung der Ressourcen eines einzelnen Servers  | Hinzufügen weiterer Maschinen oder Server |
| **Skalierbarkeit** | Begrenzt durch physische und wirtschaftliche Grenzen | Nahezu unbegrenzt durch Hinzufügen weiterer Server |
| **Verfügbarkeit** | Single Point of Failure: Ausfall eines Servers beeinträchtigt alle Daten | Höhere Verfügbarkeit durch Datenverteilung auf mehrere Server |
| **Lastverteilung** | Keine Lastverteilung, da nur ein Server verwendet wird | Effektive Lastverteilung durch mehrere Server |
| **Komplexität** | Einfacher zu implementieren und zu verwalten | Komplexer zu verwalten aufgrund der Verteilung und Koordination der Daten |
| **Konsistenz** | Einfach zu gewährleisten, da alle Daten auf einem Server liegen | Schwieriger zu gewährleisten über mehrere Server hinweg |
| **Kosten** | Anfänglich kostengünstiger, aber teuer bei hohen Aufrüstungen | Initial höhere Kosten, aber bessere Kostenkontrolle bei Wachstum |

Aufgrund Komplexität, Konsistenz und Kosten habe ich mich für die Vertikale Skalierung entschieden.

Mit folgendem Script kann Vertikal Skaliert werden, die DB steht während der Skalierung immer vollumfänglich zur Verfügung.

- Instance class: db.t3.micro --> db.t3.medium
- Storage:        20GB --> 30GB

![scale_rds_instance.py](./python/scale_rds_instance.py)

#### Sicherung / Wiederherstellung
##### Automatische Backups
Beim Erstellen der AWS RDS Instanz wird automatisch ein Backup erstellt. 
Im Anschluss wird täglich zwischen 02:00 und 03:00 Uhr ein Backup erstellt, welches sieben Tage lang aufbewahrt wird.

##### Multi Availability Zone Deployment
Das Multi Availability Zone Deployment wurde ebenfalls aktiviert. Es sorgt für Hochverfügbarkeit und Ausfallsicherheit, indem Datenbanken in mehrere Verfügbarkeitszonen (Availability Zones) repliziert werden. 

Dies hat folgende Vorteile:

Automatische Synchronisierung:
Im Multi-AZ-Deployment wird eine primäre RDS-Instanz in einer Verfügbarkeitszone erstellt und eine sekundäre Standby-Instanz in einer anderen Verfügbarkeitszone. Die Daten werden automatisch und synchron zwischen der primären und der sekundären Instanz repliziert.

Automatischer Failover:
Bei einem Ausfall der primären Instanz (z.B. bei Hardwarefehlern, Netzwerkausfällen oder Wartungsarbeiten) schaltet RDS automatisch auf die sekundäre Standby-Instanz um. Dieser Failover-Prozess ist so konzipiert, dass er minimalen Ausfall und Unterbrechung für die Anwendungen, die auf die Datenbank zugreifen, verursacht.

Keine manuelle Eingriffe notwendig:
Da der Failover-Prozess automatisch abläuft, sind keine manuellen Eingriffe seitens des Benutzers erforderlich. Das sorgt für eine schnelle Wiederherstellung und minimale Ausfallzeit.

Hohe Verfügbarkeit:
Durch die Verteilung der Datenbankinstanzen über mehrere Verfügbarkeitszonen hinweg bietet Multi-AZ-Deployment eine hohe Verfügbarkeit und schützt vor AZ-spezifischen Ausfällen.

Des Weiteren besteht die Möglichkeit, jederzeit manuelle Snapshots zu erstellen. Die folgenden Scripts ermöglichen die manuelle Erstellung von Snapshots sowie die Rücksetzung der AWS RDS Instanz aus dem letzten Snapshot.
- ![create_rds_snapshot.py](./python/create_rds_snapshot.py)
- ![restore_latest_manual_snapshot.py](./python/restore_latest_manual_snapshot.py)

Mit folgendem Script können sämtliche manuellen Snapshots gelöscht werden.
- ![delete_manual_snapshots.py](./python/delete_manual_snapshots.py)

##### Point-in-Time-Restores
Der Restore Point-in-Time bei AWS RDS ermöglicht es, eine Datenbank auf einen bestimmten Zeitpunkt in der Vergangenheit wiederherzustellen. Dies ist besonders nützlich, um Datenverlust aufgrund von Benutzerfehlern, Anwendungsfehlern oder anderen Problemen zu minimieren.

Grundlagen des Point-in-Time-Restores:

Automatische Backups:
AWS RDS erstellt automatisch tägliche Snapshots Ihrer RDS-Instanzen und speichert Transaktionsprotokolle (Transaction Logs) kontinuierlich. Diese Daten werden in S3 gespeichert und sind die Grundlage für den Point-in-Time-Restore.

Aufbewahrungszeitraum:
Die Aufbewahrungsdauer der automatischen Backups kann von einem Tag bis zu 35 Tagen konfiguriert werden. Während dieses Zeitraums können Sie eine Wiederherstellung auf einen beliebigen Zeitpunkt innerhalb dieser Periode durchführen.

Mit folgendem Script kann ein Point-in-Time Restore angestossen werden.
- ![restore_point_in_time_database.py](./python/restore_point_in_time_database.py)

Mit folgendem Script kann der Point-in-Time Restore wieder gelöscht werden.
- [delete_rds_instance_restore.py](./python/delete_rds_instance_restore.py)

### Sprints
Am Ende eines Sprints findet eine Reflexion statt, die ein wesentlicher Bestandteil des agilen Projektmanagements ist. In diesem Prozess werden nicht nur die erreichten Fortschritte betrachtet, sondern auch Herausforderungen, Erfahrungen und mögliche Verbesserungspotenziale identifiziert. Ein zentrales Element dieser Reflexion ist die grafische Erfassung des Status der Taskliste, die dazu dient, einen klaren Überblick über den Verlauf des Sprints zu erhalten.

#### Sprint 1 - 27.05.2024
![Sprint-Overview](./bilder/sprint-1.svg)

##### Reflektion
**github**
Die Projektmanagement-Tools von GitHub sind äusserst effizient. Durch die einfache Erstellung von Kanban-Boards, Roadmaps und Aufgabenlisten erhält man schnell und übersichtlich den aktuellen Projektstatus. Aus diesem Grund habe ich mich für diese Semesterarbeit für die Verwendung von GitHub entschieden, was sich als gute Entscheidung herausgestellt hat.

**Fachdozent**
Gut war, dass ich mich frühzeitig mit dem Fachdozent Thomas Kälin abgesprochen habe, um ein gemeinsames Verständnis der Semesterarbeit zu haben. So konnte das ERD für das WMS relativ schnell fertiggestellt werden. Nach Absprache haben wir uns entschieden, das Datenbankschema des WMS in ein DWH Stern Schema zu überführen. Dies wird eine Herausforderung werden, da auf meiner Seite kein Knowhow dafür vorhanden ist. Der Knowhow Aufbau für diese Konvertierung wurde für Sprint 2 eingeplant. 

**Projekt / Dokumentation**
Bei der Erstellung der SEUSAG / Risikoanalyse wurde mir bewusst, dass AWS RDS eine grosse Herausforderung für mich werden könnte, da wir dieses Thema im Unterricht nicht behandelt haben und diese Funktion in den zur Verfügung gestellten AWS LABs nicht genutzt werden kann. Daher ist das Zusammenspiel von AWS RDS / Prometheus derzeit eine Blackbox. Es wird eine spannende Herausforderung für Sprint 2 in dieser Semesterarbeit.
Aus der letzten Semesterarbeit habe ich mitgenommen, dass in der Einleitung ein Beispiel fehlte, welches nun für diese Arbeit erstellt wurde.

**Kein LAB für AWS RDS**
Leider haben wir kein Labor freigeschaltet, das AWS RDS unterstützt. Daher nutze ich meinen persönlichen Account, was die Tests aufgrund der entstehenden Kosten etwas einschränkt. Dennoch ist es erstaunlich, wie viel mit einer Free Tier RDS-Instanz möglich ist.

#### Sprint 2 - 17.06.2024
![Sprint-Overview](./bilder/sprint-2.svg)

##### Reflektion

**Warehouse Management System (WMS)**
Das Datenbankkonzept für das Lagerverwaltungssystem (WMS) wurde in zwei Iterationen mit dem Fachdozenten Thomas Kälin erarbeitet. Hier habe ich gute Inputs vom Fachdozenten bezüglich der Verwaltung bzw. des Status in den verschiedenen Tabellen sowie Zwischentabellen für die Behälter erhalten.
Für die Modellierung der ERD habe ich mit MySQL Workbench gute Erfahrungen gemacht. Es ist einfach zu bedienen und übersichtlich. Ausserdem kann der Export direkt in das AWS RDS importiert werden. 

**Data Warehouse (DWH)**
Die von Thomas Kälin zur Verfügung gestellten Videos über Data Warehouse Grundlagen wurden studiert. Auf der Grundlage des neu erworbenen Knowhows wurde ein erster Entwurf eines Stern-Schema-Modells für das DWH erstellt.
Der Entwurf muss noch mit dem Fachdozenten besprochen werden und die Aufgabe in den Sprint 3 übernommen werden. 
Ursache für den Verzug war das Prometheus Monitoring, welches mehr Zeit als geplant in Anspruch genommen hat.

**IaC Deployment AWS RDS**
Die Bereitstellung der AWS RDS MariaDB Datenbank mittels Python Script (bot03) war eine spannende Herausforderung. Hier konnte ich von den Learnings aus dem 2. Semester profitieren und erstellte gleich zu Beginn ein Config File, in dem die relevanten Variablen verwaltet werden. Ebenso wurden gleich entsprechende Löschscripte erstellt, um das Testen zu erleichtern und Kosten zu sparen.
Ebenso kann das Datenbankschema per Script importiert werden.

**Backup AWS RDS**
Die Backup-Möglichkeiten, die AWS RDS bietet, haben mich sehr beeindruckt. Viele tolle Funktionen werden standardmässig angeboten. 
Auch das Erstellen / Löschen / Wiederherstellen via Python Script (boto3) hat im Test sehr gut funktioniert.
Die Sekundärdatenanalyse war eine wertvolle Methode, um mir ein Bild über die Backup-Möglichkeiten von AWS RDS zu machen und eine Entscheidung über die Backup-Strategie zu treffen.

**Prometheus**
Nach dem Einlesen / Testen des AWS RDS Service hat sich herausgestellt, dass AWS RDS bereits standardmässig einiges an Monitoring zu bieten hat. AWS RDS sendet automatisch Metriken an CloudWatch, einschliesslich CPU-Auslastung, Speichernutzung, I/O-Operationen, Anzahl der Verbindungen und Latenzzeiten. Es können Alarme konfiguriert werden, die auf der Grundlage bestimmter Schwellenwerte für die Metriken ausgelöst werden. Wenn ein Alarm ausgelöst wird, können Aktionen wie das Versenden von Benachrichtigungen oder das automatische Skalieren der Datenbank gestartet werden.
CloudWatch Dashboards ermöglichen die Visualisierung mehrerer Metriken auf einem einzigen Bildschirm.

Um die Metrics in Prometheus zu bringen, musste ich nach einer Alternative suchen. Bei der Recherche bin ich auf den (Prometheus-RDS-Exporter)[https://github.com/qonto/prometheus-rds-exporter] gestossen, welcher die Anforderung aus der Semesterarbeit abdeckt.
Bei der Implementierung gab es einige Herausforderungen, da ich die Prometheus Umgebung über ein Python Skript (boto3) zur Verfügung stellen wollte.
Spezielle IAM Berechtigungen für die EC2 Instanz waren notwendig, um mit dem Exporter auf AWS RDS Metrics zugreifen zu können.
Aufgrund des Inputs aus dem Modul "Security, Container Security (Podman)" wollte ich Prometheus nicht in einem Docker Container laufen lassen (wie im Repo beschrieben), sondern über Podman Compose starten.
Da Prometheus für den Zugriff auf die RDS Exporter Metrics die interne IP-Adresse der EC2 Instanz benötigt, musste ich ein Bash Script erstellen. Eigentlich hätte ich gerne eine Lösung gefunden, um diese Daten zur Laufzeit beim Erstellen der EC2 Instanz zu erzeugen. Diverse Versuche mit Jinja Template innerhalb von Userdata sind jedoch gescheitert. Dies wäre aber sicherlich ein Punkt, der noch einmal untersucht werden sollte.

Es dauerte länger als erwartet, Prometheus für AWS RDS zu implementieren.
Für die nächste Semesterarbeit möchte ich die Zieldefinition nicht mehr so spezifisch machen. Ich denke, dass das Standardmonitoring der AWS zielführender gewesen wäre.

**Plantuml**
Um die Struktur der Prometheus Instanz zu visualisieren, habe ich mich für ein Sequenzdiagramm entschieden. 
Durch den Input aus dem Modul MSVC in diesem Semester wollte ich die Grafik mit Plantuml durch github automatisiert erstellen lassen.
Bei den ersten Versuchen konnte die Grafik zwar im Action Workflow erstellt werden, jedoch aufgrund fehlenden Berechtigungen nicht ins Repo zurück geliefert werden.
Um dieses Problem zu beheben, musste die Workflow Permission in den Einstellungen des Repository angepasst werden.
Bei weiteren Tests habe ich dann festgestellt, dass der Workflow einen Fehler ausgibt, wenn keine Änderungen an der Grafik vorgenommen wurden. Mit einer zusätzlichen Prüfung auf Änderungen beim Rendern konnte dieses Problem gelöst werden.
Es ist eine tolle Sache, wenn man die Grafik im Code anpassen kann und das Rendering automatisch erfolgt.

**Testing**
Um die Qualität der Semesterarbeit sicherzustellen, wurden erste Testfälle erstellt und erste Tests durchgeführt. 
Dabei ist mir aufgefallen, dass der SQL Dump Import auf AWS RDS in die DB InnoDB erfolgt, welche von MariaDB als Storage Engine verwendet wird. Dies wurde korrigiert. So wird nun beim Erstellen der AWS RDS Instanzen die Datenbank "wms" erstellt, in welche dann der SQL Dump Import erfolgt.

Für das lokale Testen habe ich mich entschieden, auf die MySQL Workbench zu verzichten und nur mit DBeaver zu arbeiten. Ausserdem wird Podman anstelle von Docker verwenden.

#### Sprint 3 - 08.07.2024
xxx-picture

##### Reflektion

**Prometheus Node Exporter**
Um auch die Prometheus-Instanz zu überwachen, entschied ich mich, den Prometheus Node Exporter auf der EC2-Instanz zu installieren und ebenfalls in Prometheus zu integrieren.
So konnte ich auch für die EC2 Instance Alert Rules definieren.

**IAM boto3 Scripts**
Bei der Prüfung der EC2-Instanz wurde festgestellt, dass die Einbindung der Config.ini in den IAM Scripts fehlte und beim IAM Instances Profil eine Verwechslung mit dem Namen vorlag. Diese Fehler wurden korrigiert und zusätzlich Delete Scripts zum Testen erstellt.

**Lifecyclemanagement**
Für die Beschreibung des Deployment-Prozesses habe ich mich ebenfalls für ein Sequenzdiagramm entschieden, welches mit PlantUML erstellt wird. Ich konnte meine Erkenntnisse aus dem Sprint 2 in die aktuelle Planung einfliessen lassen.

**Security**
Auf Input von Marcel Bernet aus dem Modul SEC (BEN) wurde ein SAST (Static Application Security Testing) Workflow für das Github Repository der Semesterarbeit eingerichtet.
Beim Testen wurde eine Warnung für das Skript create_iam_role.py ausgegeben, in dem kein Request Timeout implementiert war. Dieser teil wurde aus dem Script entfernt, da ein Download aus dem Web ein Sicherheitsrisiko darstellt.
Ebenso wurden die Deployment-Skripte als Sicherheitsrisiko (CWE-78 - OS Command Injection) eingestuft. Aus diesem Grund wurden alle Skripte so umgeschrieben, dass sie als Module importiert und als Import aus einem zentralen Skript aufgerufen werden können.

Ebenfalls wurde für die Docker Images Tags gesetzt.
Beim Testen des Prometheus Containers mit Tag ist mir aufgefallen, dass kein Alert ausgelöst wird, wenn keine RDS-Instanz vorhanden ist. Der Grund dafür ist, dass die Expression in dieser Konstellation keinen Wert zurückgibt (Empty query result). Dies wurde mit der Alert Rule NoDataAlert abgefangen.

**Review Fachdozent**
Beim Austausch mit dem Fachdozenten Thomas Kälin haben sich folgende Optimierungen ergeben:
- Zusätzliche DWH Dimensionstabellen (Datum / Statuscode)
  Ohne Datum wäre das DWH nicht wirklich sinnvoll, da die Auswertungen zeitlich nicht eingeschränkt werden können. Der Austausch mit Thomas Kälin hat mein Verständnis von OLAP weiter vertieft. Ich dachte, dass man nur abgeschlossene Aufträge aus dem WMS exportieren würde. Wird bei jedem Export eine Momentaufnahme exportieren, sind die Auswertungsmöglichkeiten noch viel grösser. Daher sind die beiden Dimensionstabellen (Datum / Statuscode) sehr sinnvoll.
- Anpassung an den boto3 Scripts bei der Prüfung des config.ini.
  In den boto3 Scripts hatte ich das Configparsing durchgeführt, bevor ich geprüft habe, ob das config.ini vorhanden ist.
  Dies macht keinen und wurde angepasst.
- Anpassung der Overview.
  Die Darstellung der Overview war nicht verständlich und gab den Prozess-Ablauf nicht korrekt wieder. Hier war die Aussensicht von Thomas Kälin sehr hilfreich und es konnten entsprechende Optimierungen vorgenommen werden.

**Präsentation**
Für die Präsentation der Semesterarbeit habe ich mich für Google Docs entschieden. Google Docs bietet gute Vorlagen und ist einfach zu bedienen. Ausserdem benötigt man keine zusätzliche Software und kann über das Web darauf zugreifen. Ein Nachteil aus meiner Sicht ist, dass Google Docs das Dateiformat svg nicht unterstützt.

Die Präsentation der Semesterarbeit besteht aus 5 Folien, die nur die relevanten Informationen enthalten, um es für die Teilnehmer spannend zu halten. Zeitlich werde ich ein Drittel für die Präsentation aufwenden und die restlichen zwei Drittel für eine Live-Demo. So soll es für die Teilnehmer spannend bleiben und durch die Live Demo ein gutes Verständnis für die Semesterarbeit vermittelt werden.

Um die Live Demo mit möglichst wenig Wartezeit durchführen zu können, habe ich mich für folgende Anpassungen entschieden:
- AWS RDS Instance wird vor der Live Demo deployed, da die Erstellung ca. 5 Minuten dauert.
- Package update / upgrade wird im cloud-init für die EC2 Prometheus Instance deaktiviert, damit diese in der Live Demo möglichst schnell online ist.
- Prometheus Scrape Intervall von 30 auf 10 Sekunden angepasst. Alert Rules von 1m auf 30sec angepasst. Dadurch werden Alert Statusänderungen in der Live demo schneller sichtbar.

**Grafana**
Um die Präsentation etwas spannender zu gestalten, habe ich mich entschieden die Grafana Dashboards aus dem Repo [github.com/qonto/prometheus-rds-exporter](https://github.com/qonto/prometheus-rds-exporter) ebenfalls in die Semesterarbeit zu integrieren. 
Es ist einfacher, die Möglichkeiten von Prometheus in einem Dashboard zu präsentieren, als die Metriken mit Hilfe von Promql zu zeigen.

**Lifecycle-Management**
Die Auseinandersetzung mit dem Lifecycle-Management hat mein Verständnis bezüglich Backup, Restore und Ausfallsicherheit in AWS RDS erweitert. Insbesondere die Skalierung während des Betriebs und der Point-in-Time-Restore haben mich überzeugt. Um auch den Restore und die Skalierung mittels Boto3 abdecken zu können, habe ich die config.ini um folgende Punkte erweitert:

- Multi-Availability Zone deployment
- DB Engine Version
- Backup Retention Period
- Storage Size

Des Weiteren konnten die Alerts in das Lifecycle-Management integriert werden, sodass erkannt wird, wenn eine Skalierung läuft oder Maintenance-Arbeiten durch AWS anstehen.
Das gesamte Testing hat viel Zeit in Anspruch genommen. Dabei ist mir aufgefallen, dass die Skalierung relativ lange dauert (ca. 15 Min.). Dies ist auch in den Grafana-Dashboards ersichtlich.
Die Dauer des Restores der RDS-Instanz entspricht in etwa der Erstellung (ca. 10 Min.).

### Testing

#### Testprotokoll
Das Testprotokoll soll dazu beitragen, die Effizienz, Qualität und Zuverlässigkeit der Semesterarbeit zu verbessern, indem es einen strukturierten und nachvollziehbaren Testprozess ermöglicht.

| Fall | Beschreibung | Test Step | Erwartetes Resultat | Status | Test Datum |
| ---     | ---     | ---   | ---     | ---   |  ---   |
| TC-01 | Erstellung der AWS RDS Database per Python Script | Script ![create_rds_instances.py](./python/create_rds_instances.py) ausführen. | Es wird eine ADS RDS Database erstellt mit dem DB Identifier sem-3-db-instance. Nach dem erstellen wird auto. ein Backup angelegt. Die Datenbank ist via AWS EndpointURL von extern erreichbar und hat neben den Standard-Datenbanken eine Datenbank mit dem Namen "wms". | OK | 2024-06-23 |
| TC-02 | Import des MariaDB Datenbankschema auf AWS RDS per Python Script| Script ![import_dum-wms.py](./python/import_dum-wms.py) ausführen. | Der Dump wir in die AWS RDS Datenbank wms importiert. Sämtliche Tabellen sind vorhanden und können via Datenbankverwaltungstool mutiert werden.| OK | 2024-06-23 |
| TC-03 | Erstellung MariaDB Snapshot auf AWS RDS per Python Script | Script ![create_rds_snapshot.py](./python/create_rds_snapshot.py) ausführen. | Es wir ein Snapshot auf AWS RDS für die DB Instance "sem-3-db-instance" erstellt. | OK | 2024-06-09 |
| TC-04 | Restore des letzten MariaDB Snapshot auf AWS RDS per Python Script| Script ![restore_latest_manual_snapshot.py](./python/restore_latest_manual_snapshot.py) ausführen. | Es wird ein Restore des letzten AWS RDS Snapshot für die DB Instance "sem-3-db-instance" erstellt. | OK | 2024-06-09 |
| TC-05 | Löschen der manuellen Snapshots auf AWS RDS | Script ![delete_manual_snapshots.py](./python/delete_manual_snapshots.py) ausführen. | Die Manuellen Snapshots der DB Instance "sem-3-db-instance" werden gelöscht. | OK | 2024-06-09 |
| TC-06 | Löschen des AWS RDS Restore | Script ![delete_rds_instance_restore.py](./python/delete_rds_instance_restore.py) ausführen. | Der Restore der DB-Instance "sem-3-db-instance" wird auf AWS RDS gelöscht. | OK | 2024-06-09 |
| TC-07 | Löschen der manuellen Snapshots | Script ![delete_manual_snapshots.py](./python/delete_manual_snapshots.py) | Sämtliche manuellen Snapshot für die AWS RDS DB Instance "sem-3-db-instance" werden gelöscht. | OK | 2024-06-09 |
| TC-08 | Löschen der AWS RDS DB Instance | Script ![delete_rds_instances.py](./python/delete_rds_instances.py) ausführen. | Die AWS RDS RDS DB Instance "sem-3-db-instance" wird gelöscht.  | OK | 2024-06-09 |
| TC-09 | Erstellung AWS IAM Role für Zugriff der AWS EC2 Instance auf AWS RDS | Script ![create_iam_role.py](./python/create_iam_role.py) ausführen. | AWS IAM Role prometheus-rds-exporter wurde erfolgreich erstellt.| OK | 2024-06-20 |
| TC-10 | Erstellung AWS IAM Policy für Zugriff der AWS EC2 Instance auf AWS RDS | Script ![create_iam_policy.py](./python/create_iam_policy.py) ausführen. | AWS IAM Policy prometheus-rds-exporter wurde erfolgreich erstellt und der Role prometheus-rds-exporter zugefügt. | OK | 2024-06-20 |
| TC-11 | Erstellung AWS IAM Instance Profil für Zugriff der AWS EC2 Instance auf AWS RDS | Script ![create_iam_instances_profile.py](./python/create_iam_instances_profile.py) ausführen. | AWS IAM Instance Profile prometheus-iam-instance-profile wurde erfolgreich erstellt und der Role prometheus-rds-exporter zugewiesen. | OK | 2024-06-20 |
| TC-12 | Erstellen der AWS EC2 Prometheus Instance | Script ![create_ec2_instances_prometheus_rds_exporter.py](./python/create_ec2_instances_prometheus_rds_exporter.py) ausführen. | AWS EC2 Instance Prometheus-RDS-Exporter wurde erfolgreich gestartet. | OK | 2024-06-23 |
| TC-13 | Zugriff Prometheus via Web| TC-12 | [Prometheus](./bilder/TestCases/tc-13-1.svg) ist via Public IP der EC2 Instance auf Port 9090 erreichbar. Die beiden [Targets](./bilder/TestCases/tc-13-2.svg) sind erreichbar und die Alert Rules geladen. | OK | 2024-06-23 |
| TC-14 | Testing Alert Rule von Prometheus | Script ![delete_rds_instances.py ](./python/delete_rds_instances.py ausführen.) | Der Alert AWS [RDS NoDataAlert](./bilder/TestCases/tc-14-1.svg) ist nach dem Löschen der Instance auf Firing | OK | 2024-06-23 |
| TC-15 | Löschen AWS IAM Instance Profil für Zugriff der AWS EC2 Instance auf AWS RDS| Script ![delete_iam_instance_profile.py)](./python/delete_iam_instance_profile.py) ausführen. | Das AWS IAM Instance Profile prometheus-iam-instance-profile wird von der AWS IAM Role prometheus-rds-exporter entfernt und anschliessend gelöscht. | OK | 2024-06-20 |
| TC-16 | Löschen AWS IAM Role für Zugriff der AWS EC2 Instance auf AWS RDS| Script ![delete_iam_role.py](./python/delete_iam_role.py) ausführen. | Die AWS IAM Role prometheus-rds-exporter wurde erfolgreich gelöscht. | OK | 2024-06-20 |
| TC-17 | Löschen AWS IAM Policy für Zugriff der AWS EC2 Instance auf AWS RDS | Script ![delete_iam_policy.py](./python/delete_iam_policy.py) ausführen. | AWS IAM Policy prometheus-rds-exporter wird gelöscht. | OK | 2024-06-20 |
| TC-18 | Löschen der AWS EC2 Instance | Script ![delete_ec2_instances_prometheus_rds_exporter.py)](./python/delete_ec2_instances_prometheus_rds_exporter.py) ausführen. | AWS EC2 Instance Prometheus-RDS-Exporter wird terminiert. | OK | 2024-06-20 |
| TC-19 | Testing bandit-analysis auf Security Issue im Python Code | git push ausführen | In den [Github Action](./bilder/TestCases/tc-19-1.svg) kann geprüft werden, ob finings vorhanden sind. | OK | 2024-06-30 |
| TC-20 | Testing plantuml für die auto. Aufbereitung der Sequenzdiagramme | git push ausführen | Wenn Änderungen am File Sequenzdiagramm.puml vorgenommen wurden, werden die Sequenzdiagramme neu erstellt. Die ist auch in den [Github Actions](./bilder/TestCases/tc-20-1.svg) ersichtlich. | OK | 2024-06-20 |
| TC-21 | Zugriff Grafana via Web | [Grafana](./bilder/TestCases/tc-21-1.svg) ist via Public IP der EC2 Instance auf Port 3000 erreichbar. | Login mit Grafana default Credentials, Passwort muss im Anschluss gleich neu gesetzt werden. Login mit neuem Passwort erfolgreich. | OK | 2024-06-23|
| TC-22 | Grafana Data-Source | TC-21 | [Data-Source](./bilder/TestCases/tc-21-1.svg) wurde erfolgreich importiert und Verbindungs-Test zur Prometheus Datenbank ist erfolgreich. | OK | 2024-06-23|
| TC-23 | Grafana Dashboard | TC-21 | [Dashboards](./bilder/TestCases/tc-23-1.svg) wurden erfolgreich importiert und können ohne Fehler aufgerufen werden. | OK | 2024-06-23|
| TC-24 | Point-in-Time AWS RDS Restore | Skript ![restore_point_in_time_database.py](./python/restore_point_in_time_database.py) ausführen. | Es wird eine zusätzliche AWS RDS Instanz erstellt mit dem DB identifier "sem-3-db-instance-restore", welche den Datenstand der definierten Restore Zeit hat. | OK | 2024-05-25 |
| TC-25 | Skalierung AWS RDS Instance | Skript [scale_rds_instance.py](./python/scale_rds_instance.py) ausführen. | Die Instance Class wird von db.t3.micro auf db.t3.medium erhöht, das Storage wird von 20GB auf 30GB erhöht.| OK | 2024-05-25 |

## Präsentation Semesterarbeit
Für die Präsentation meiner Semesterarbeit habe ich mich für Google Docs entschieden. Um die zeitliche Begrenzung von ca. 10 Minuten einzuhalten, habe ich mich darauf konzentriert, die wichtigsten Informationen auf fünf Folien zu komprimieren. Ziel ist es, dass die Zuhörer den Inhalt meiner Semesterarbeit verstehen und durch die Live-Demo einen fundierten Einblick in die Semesterarbeit erhalten.

[ITCNE23-SEM-III - Relationale Datenbank / AWS RDS](https://docs.google.com/presentation/d/1dbV1jay0Fk4rrnaY-sxRZ6ak9vmNZGNis8b-NzcfKRk/edit?usp=sharing)

## Fazit der Semesterarbeit
Das Fazit der Semesterarbeit soll ein Zusammenzug der drei Sprints sein und wird in einem separaten Punkt beschrieben ([Fazit](#fazit)). 
