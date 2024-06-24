#!/usr/bin/python3.10
import boto3
import os
import time
import subprocess

if __name__ == "__main__":
    # Den Verzeichnispfad des aktuellen Skripts ermitteln
    script_dir = os.path.dirname(os.path.abspath(__file__))

    # In das Verzeichnis des Skripts wechseln
    os.chdir(script_dir)

    # Liste der erlaubten Skripte
    script_names = ['delete_ec2_instances_prometheus_rds_exporter.py', 'delete_iam_instance_profile.py', 'delete_iam_role.py', 'delete_iam_policy.py']

    # Absolute Pfade für Skripte
    allowed_scripts = {script: os.path.join(script_dir, script) for script in script_names}

    for script_name in script_names:
        try:
            if script_name not in allowed_scripts:
                raise ValueError(f"Skript {script_name} ist nicht erlaubt.")

            script_path = allowed_scripts[script_name]

            # Befehl zum Ausführen des Skripts
            command = ['python3', script_path]

            # Skript ausführen
            subprocess.run(command, check=True)
            time.sleep(2)

        except (subprocess.CalledProcessError, ValueError) as e:
            # Fehler behandeln, wenn das Skript fehlschlägt oder nicht erlaubt ist
            print(f"Fehler beim Ausführen von {script_name}: {e}")
