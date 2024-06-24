#!/usr/bin/python3.10
import os
import time
import subprocess

if __name__ == "__main__":
    # Den Verzeichnispfad des aktuellen Skripts ermitteln
    script_dir = os.path.dirname(os.path.abspath(__file__))

    # Liste der zulässigen Skripte mit den entsprechenden Schlafzeiten (in Sekunden)
    scripts_with_sleep_times = {
        'create_iam_role.py': 2,
        'create_iam_policy.py': 2,
        'create_iam_instances_profile.py': 6,
        'create_ec2_instances_prometheus_rds_exporter.py': 5
    }

    # Feste absolute Pfade für Skripte erstellen
    allowed_scripts = {script: os.path.join(script_dir, script) for script in scripts_with_sleep_times}

    for script_name, sleep_time in scripts_with_sleep_times.items():
        try:
            # Skriptpfad aus der erlaubten Liste abrufen
            script_path = allowed_scripts[script_name]

            # Überprüfen, ob die Datei existiert und ein reguläres Skript ist
            if not os.path.isfile(script_path):
                raise ValueError(f"Skript {script_path} ist nicht vorhanden oder kein reguläres Skript.")

            # Befehl zum Ausführen des Skripts
            command = ['python3', script_path]

            # Skript ausführen
            subprocess.run(command, check=True)

            # Pause für eine bestimmte Zeit, bevor mit dem nächsten Skript fortgefahren wird
            time.sleep(sleep_time)

        except (subprocess.CalledProcessError, ValueError) as e:
            # Fehler behandeln, wenn das Skript fehlschlägt oder nicht erlaubt ist
            print(f"Fehler beim Ausführen von {script_name}: {e}")
