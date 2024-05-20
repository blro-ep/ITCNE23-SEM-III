# ITCNE23-SEM-III - WMS Datenbankkonzept inkluse  AWS-Deployment

(Meremeid)

## Einleitung
Die Semesterarbeit zielt darauf ab, ein Datenbankkonzept für ein Warehouse Management System (WMS) zu entwickeln und umzusetzen, mit dem Aufträge effizient abgewickelt werden können. Der Fokus liegt dabei auf der Datenmodellierung und dem Datenschema, wobei ausschliesslich der Backend-Teil implementiert wird, während die Frontend-Entwicklung ausgeschlossen ist.

**Datenmodellierung für WMS:** Die Herausforderung besteht darin, ein geeignetes Datenmodell zu entwerfen, das die Anforderungen an Benutzerverwaltung, Kundenverwaltung, Artikelverwaltung, Seriennummernverwaltung und Lieferscheinverwaltung erfüllt. Dabei müssen die Beziehungen zwischen den verschiedenen Entitäten berücksichtigt werden, um eine effiziente Datenverwaltung zu gewährleisten.

**Deployment in AWS mit IaC:** Die Semesterarbeit erfordert die Fähigkeit, das Datenbankkonzept mithilfe von Infrastructure as Code (IaC) in der AWS-Cloud bereitzustellen. Dies erfordert Kenntnisse in der Konfiguration von AWS-Ressourcen und -Diensten sowie in der Automatisierung von Bereitstellungsprozessen mittels Python-Skripten.

**Monitoring mit Prometheus:** Ein weiteres Ziel ist es, die Datenbank mittels Prometheus zu überwachen. Dies erfordert die Implementierung von Monitoring-Metriken, um Einblicke in den Zustand und die Leistung der Datenbank zu erhalten. Die Herausforderung besteht darin, relevante Metriken zu identifizieren und zu implementieren, um potenzielle Probleme frühzeitig zu erkennen und zu beheben.

**Backupstrategie:** Die Entwicklung einer effektiven Backup-Strategie ist ebenfalls ein wichtiger Teil der Problemlösung. Dies beinhaltet die regelmässige Sicherung der Datenbank sowie die Implementierung von Wiederherstellungsmechanismen, um die Integrität und Verfügbarkeit der Daten im Falle eines Datenverlustes zu gewährleisten.

**Lifecycle Management:** Ein weiteres Ziel der Arbeit ist es, das Lifecycle-Management der Datenbank zu beschreiben und zu dokumentieren. Dies beinhaltet die Planung, Bereitstellung, Überwachung, Skalierung und Aktualisierung der Datenbankinstanzen im gesamten Lebenszyklus. 

Zusammenfassend soll die Semesterarbeit das Fachwissen vermitteln, um Datenbankkonzepte in die Praxis umzusetzen. Dies beinhaltet die Entwicklung eines geeigneten Datenmodells, die Bereitstellung der Datenbank in der Cloud, die Überwachung ihrer Leistung und Verfügbarkeit sowie die Implementierung einer zuverlässigen Backupstrategie. Durch diesen praxisorientierten Ansatz möchte ich in der Lage sein, ähnliche Herausforderungen in meiner späteren beruflichen Tätigkeit erfolgreich zu meistern.

### Beispiel WMS Anforderung
Die Datenbank muss berücksichtigen, dass ein Kunde mehrere Bestellungen haben kann. Ein Auftrag besteht aus einem oder mehreren Artikeln, wobei für einige Artikel die Eingabe der Seriennummer erforderlich ist.
Damit der Auftrag an den Kunden ausgeliefert werden kann, muss er von einem Mitarbeiter bearbeitet werden. Dies beinhaltet die Kommissionierung der Artikel und die Eingabe der Seriennummer falls notwendig.

Ein konkretes Beispiel könnte wie folgt aussehen:
Mitarbeiter "X" bearbeitet den Auftrag des Kunden "Y". Der Auftrag enthält 2 Positionen mit unterschiedlichen Artikeln. Position 1 enthält 3 Stück des Artikels "xxx" und Position 2 enthält 2 Stück des Artikels "yyy". Der Artikel "yyy" ist seriennummernpflichtig, d.h. bei der Kommissionierung muss die Seriennummer des Artikels eingegeben werden. Die Artikel werden in einen Versandbehälter gelegt und dem Spediteur übergeben, der die Artikel an den Kunden liefert.

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

### Roadmap
Die strategische Planung und Steuerung der Sprintarbeit erfolgt anhand einer detaillierten Roadmap, die wichtige Meilensteine enthält. Diese Meilensteine sind auf die einzelnen Sprints abgestimmt und dienen als Leitfaden für die Fortschrittskontrolle und den erfolgreichen Abschluss der Projektphasen.

| Datum | Sprint |
| --- | --- |
| 27.05.2024 | Ergebnis 1. Sprint |
| 17.06.2024 | Ergebnis 2. Sprint |
| 12.07.2024 | Ergebnis 3. Sprint / Abgabe / Präsentation |

### Tasklist
Um die Verwaltung und Organisation der Aufgaben weiter zu optimieren, wird eine Taskliste erstellt. Diese dient dazu, Aufgaben zu erfassen, sie nach verschiedenen Kategorien zu filtern und zu gruppieren. Das Ziel ist, eine bessere Übersichtlichkeit und Strukturierung innerhalb des Projektmanagements zu gewährleisten.

Die Taskliste wird so gestaltet, dass jeder Task mit spezifischen Metadaten versehen werden kann, um eine einfache Zuordnung zu bestimmten Kategorien zu ermöglichen. 

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
- IaC   --> Task für Infrstructure as Cose
- AWS   --> Task für Amazon Web Services

### SEUSAG
#### Systemgrenze

<img src="./bilder/Systemgrenzen.drawio.svg">

#### Schnittstellen
| Schnittstelle | <div style="width:175px">Element</div> | Beschreibung |
|---------------|---------|-------------|
| S1 | AWS CLI / Phyton (boto3) | Um Datenbankressourcen in der AWS Cloud bereitzustellen, wird die AWS CLI / boto3 verwendet. |
| S2 | Phyton (boto3) / AWS Services | Mit Hilfe von boto3 wird der AWS-Datenbankservice entsprechend den Anforderungen konfiguriert. |
| S3 | AWS Services / MariaDB | Die MariaDB soll auf dem AWS RDS (Amazon Relational Database Service) zur verfügung gestellt werden. |
| S4 | MariaDB / Entwickler | Der Entwickler sollte die Möglichkeit haben, auf die MariaDB zuzugreifen, um deren Ressourcen zu überprüfen bzw. um den Status zu überprüfen. |

#### Einflussgrössen

<img src="./bilder/Einflussgroessen.drawio.svg">

| Einflüsse | <div style="width:175px">Element</div> | Beschreibung |
|---------------|---------|-------------|
| E1 | Cloud Provider | Der Cloud Provider beeinflusst die Verfügbarkeit und Zuverlässigkeit der bereitgestellten Dienste. Ein zuverlässiger Provider mit einer stabilen Infrastruktur minimiert das Risiko von Ausfallzeiten und Unterbrechungen, die sich negativ auf die Semsterarbeit auswirken könnte. Die Möglichkeit der schnellen Skalierung von Ressourcen ist ein wesentlicher Vorteil von AWS, weshalb dieser Provider für die Semesterarbeit ausgewählt wurde. |
| E2 | Entwickler | Die Fähigkeit des Entwicklers, sich selbst zu organisieren, Prioritäten zu setzen und eigenverantwortlich zu arbeiten, beeinflusst seine Effizienz und die Qualität der Semesterarbeit. Dazu gehören auch die technischen Fähigkeiten und die Erfahrung des Entwicklers.  |
| E3 | Zeit  | Der Abgabetermin für die Semesterarbeit legt den Zeitrahmen fest, in dem alle Projektaktivitäten abgeschlossen sein müssen. Die zeitliche Begrenzung erfordert eine sorgfältige Priorisierung der Aufgaben und Aktivitäten. Kritische Aufgaben müssen identifiziert werden, um sicherzustellen, dass sie rechtzeitig abgeschlossen werden, während weniger wichtige Aufgaben zurückgestellt werden können. |
| E4 | Dozent | Der Dozent legt die Richtlinien und Erwartungen für die Semesterarbeit fest, einschließlich des Umfangs, der Struktur, der Bewertungskriterien und der Abgabefristen. Das Einholen von Feedback und die Berücksichtigung der Bewertungskriterien des Dozenten haben hohe Priorität, um sicherzustellen, dass die Semesterarbeit den Anforderungen entspricht und erfolgreich abgeschlossen wird. |
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
AWS CLI (Amazon Web Services Command Line Interface) ist ein von Amazon Web Services bereitgestelltes Befehlszeilen-Tool zur Verwaltung von AWS-Ressourcen und zur Interaktion mit AWS-Diensten. Mit AWS CLI können Entwickler und Systemadministratoren AWS-Ressourcen über die Kommandozeile verwalten, automatisieren und skripten. 

###### boto3
boto3 ist das offizielle Software Development Kit (SDK) von AWS für die Python-Programmiersprache. Es bietet eine Sammlung von Python-Bibliotheken und Modulen, die es Entwicklern ermöglichen, auf die AWS-Dienste zuzugreifen und mit ihnen zu interagieren.
boto3 soll für die Konfiguration / Deployment von MairaDB in AWS RDS verwendet werden.

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
Ausarbeitung einer WMS Demo Konzept, welche anschliessend in ein Data Warehouse - Star Schema umgewandelt wird.
- Erstellung ERD für WMS
- Erstellung Data Warehouse (Star Schema)

#### Python (boto3) / IaC
Mittels Python (boto3) soll die WMS Datenbank auf AWS automatisiert erstellt werden.
Dazu wird ein Python Skript erstellt, welches die folgenden Punkte abdeckt:
- Anlegen der MariaDB auf AWS RDS
- Anlegen der MariaDB Tabellen und deren Abhängigkeiten

#### Prometheus
Einrichtung einer Überwachungslösung auf Basis von Prometheus, um die Leistung und Verfügbarkeit der WMS Datenbank sicherzustellen.
Es soll eine Prometheus Instanz zur Verfügung gestellt werden, welche die Metrics der WMS Datenbank beinhaltet. Diese sollte mindestens folgende Punkte beinhalten:
- Uptime der Datenbank

#### Lifecyclemanagement WMS
Das Lifecyclemanagement soll mit folgenden Punkten dokumentiert werden. 
- Inststallation / Konfiguration, 
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
- Unzureichnede Testabdeckung
- Übermäßige Komplexität in der Architektur.

##### Identifizierte Risiken
- Schlechte Kommunikation Studierende / Dozenten
- Nicht einhalten von Deadlines 
- Fehlende Dokumentation
- Unzureichnede Testabdeckung
- Übermäßige Komplexität in der Architektur

##### Risikomatrix
|<div style="width:175px">Risiko</div>| <div style="width:175px">Wahrscheinlichkeit</div> | <div style="width:175px">Auswirkung</div> | <div style="width:175px">Bewertung (W * A)</div> | <div style="width:175px">Gegenmaßnahme</div> |
|---------------|---------------|---------------|---------------|---------------|
| Schlechte Kommunikation Studierende / Dozenten:<br><br>Verzögerungen und Fehler durch mangelnde Kommunikation und Zusammenarbeit. | Hoch | Mittel | 3*2 = 6 | Regelmäßige Meetings, Kommunikationskanäl MS Teams Channel für Semesterarbeit. |
| Nicht einhalten von Deadlines:<br><br>Verzögerungen, Semserarbeit kann nicht termingerecht fertiggestellt werden. | Mittel | Hoch | 2*3 = 6 | Realistische Planung und kontinuierliches Monitoring des Fortschritts (Roadmap / Sprints). |
| Fehlende Dokumentation:<br><br>Wissensverlust und Schwierigkeiten bei der Wartung und Weiterentwicklung. | Mittel | Hoch | 2*3 = 6 | Erstellung und Pflege umfassender Dokumentation für Entwickler und Endbenutzer. |
| Fehler im Produkt, die erst nach dem Abschlusstermin der Semesterarbeit entdeckt werden. | Mittel | Hock | 2*3 = 6 | Umfassende Test-Cases erstellen. Forlaufend Testen. |
| Übermäßige Komplexität in der Architektur<br><br>Erhöhter Entwicklungsaufwand sowie Fehleranfälligkeit. | Niedrig | Mittel | 1*2 = 3 | Verwendung bewährter Architekturprinzipien un regelmäßige Architekturbewertungen. |

## Umsetzung
### Installation
#### Python
Für die Semesterarbeit wird die vorinstallierte Python Version 3.10.12 von Ubuntu 22.04 verwendent.
Es ist keine zusätzliche installion nontwendig.
[python.org](https://wiki.python.org/moin/BeginnersGuide/Download)

#### AWS CLI
AWS CLI wurde gemäss der offiziellen AWS Linux Installationsanleitung installiert (Version 2.15.22).
[Install AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html#cliv2-linux-install)

#### Boto3
Boto3 wurde gemäss folgender Anleitung installiert (Version 1.34.46).
[Install Boto3](https://boto3.amazonaws.com/v1/documentation/api/latest/guide/quickstart.html#installation)

#### Python
Für die Semesterarbeit wird die vorinstallierte Python Version 3.10.12 von Ubuntu 22.04 verwendent.
Es ist keine zusätzliche installion nontwendig.
[python.org](https://wiki.python.org/moin/BeginnersGuide/Download)

#### MariaDB
Für das lokale Testing wird das offizielle DockerHub Image von Maria DB verwendet.
[DockreHub - MariaDB](https://hub.docker.com/_/mariadb)

Der Container wird mit folgendem Compose File erstellt:
[MariaDB Docker Compose](./sql/docker-compose.yml)

Start Container
```
sudo docker compose up -d
```

#### MySQL Workbench
Die Installation von MySQL Workbench erfolgte gemäss der ofiziellen Anleitung der MySQL Community für Linux (Version 8.0.36)

[Install MySQL](https://dev.mysql.com/doc/workbench/en/wb-installing-linux.html#wb-installing-linux-requirements)

```
sudo apt-get install mysql-workbench-community
```

#### dBeaver
Die Installation von dBeaver erfolgte gemäss der ofiziellen Anleitung der DBeaver Community für Linux(Version 23.0.5).
[DBeaver Community](https://dbeaver.io/download/)

#### Visual Code Studio
Die Installation von Visual Code Studio erfolgte gemäss der ofiziellen Anleitung von Visual Studio Code für Linux (Version 1.89.1)
[Install Visualstudio](https://code.visualstudio.com/docs/setup/linux)

#### Draw.io
Die Installtion von Draw.io erfolgte gemäss der ofiziellen Anleitung von Snapcraft (Version 24.4.0)
[Install Draw.io](https://snapcraft.io/install/drawio/ubuntu)

#### BPMN
Für BPMN wird die online Version verwendet, es ist keine lokale Installation notwendig.
[BPMN](https://demo.bpmn.io/new)


### Sprints
Am Ende eines Sprints findet eine Reflexion statt, die ein wesentlicher Bestandteil des agilen Projektmanagements ist. In diesem Prozess werden nicht nur die erreichten Fortschritte betrachtet, sondern auch Herausforderungen, Erfahrungen und mögliche Verbesserungspotenziale identifiziert. Ein zentrales Element dieser Reflexion ist die grafische Erfassung des Status der Taskliste, die dazu dient, einen klaren Überblick über den Verlauf des Sprints zu erhalten.

#### Sprint 1 - 27.05.2024
xxx-picture

##### Reflektion

**xxx-Thema**-
- https://gist.github.com/philip-gai/9c801bdff0ec4c1954f18217dc808476


#### Sprint 2 - 17.05.2024
xxx-picture

##### Reflektion

**xxx-Thema**

#### Sprint 3 - 12.06.2024
xxx-picture

##### Reflektion

**xxx-Thema**

### Testing

#### Testprotokoll
Das Testprotokoll soll dazu beitragen, die Effizienz, Qualität und Zuverlässigkeit der Semesterarbeit zu verbessern, indem es einen strukturierten und nachvollziehbaren Testprozess ermöglicht.

| Fall | Beschreibung | Test Step | Erwartetes Resultat | Status | Screen |
| ---     | ---     | ---   | ---     | ---   |  ---   |
| TC-01 | xxx | xxx | xxx | xxx | [TC-xx](./xxx.png) |
| TC-02 | xxx | xxx | xxx | xxx | [TC-xx](./xxx.png) |
| TC-03 | xxx | xxx | xxx | xxx | [TC-xx](./xxx.png) |
| TC-04 | xxx | xxx | xxx | xxx | [TC-xx](./xxx.png) |


## Präsentation Semesterarbeit
Für die Präsentation meiner Semesterarbeit habe ich mich für Google Docs entschieden. Um die zeitliche Begrenzung von ca. 10 Minuten einzuhalten, habe ich mich darauf konzentriert, die wichtigsten Informationen auf 5 Folien zu komprimieren. Ziel ist es, dass die Zuhörer den Inhalt meiner Semesterarbeit verstehen und durch die Live-Demo einen fundierten Einblick erhalten.


## Fazit der Semesterarbeit
Das Fazit der Semesterabeit soll ein Zusammenzug der drei Spints sein und wir in einem seperaten Punkt beschrieben ([Fazit](#fazit)). 



