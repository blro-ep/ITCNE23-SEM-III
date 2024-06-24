#!/usr/bin/python3.10
import os
import time
import subprocess

if __name__ == "__main__":
    # Den Verzeichnispfad des aktuellen Skripts ermitteln
    script_dir = os.path.dirname(os.path.abspath(__file__))

    # Liste der erlaubten Skripte mit ihren absoluten Pfaden
    allowed_scripts = [
        os.path.join(script_dir, 'delete_ec2_instances_prometheus_rds_exporter.py'),
        os.path.join(script_dir, 'delete_iam_instance_profile.py'),
        os.path.join(script_dir, 'delete_iam_role.py'),
        os.path.join(script_dir, 'delete_iam_policy.py')
    ]

    for script_path in allowed_scripts:
        try:
            # Überprüfen, ob die Datei existiert und ein reguläres Skript ist
            if not os.path.isfile(script_path):
                raise ValueError(f"Skript {script_path} ist nicht vorhanden oder kein reguläres Skript.")

            # Befehl zum Ausführen des Skripts
            command = ['python3', script_path]

            # Skript ausführen
            subprocess.run(command, check=True)
            time.sleep(2)

        except (subprocess.CalledProcessError, ValueError) as e:
            # Fehler behandeln, wenn das Skript fehlschlägt oder nicht erlaubt ist
            print(f"Fehler beim Ausführen von {script_path}: {e}")
