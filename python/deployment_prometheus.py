#!/usr/bin/python3.10
import os
import time
import subprocess
import boto3
from botocore.exceptions import ClientError

if __name__ == "__main__":
    # Den Verzeichnispfad des aktuellen Skripts ermitteln
    script_dir = os.path.dirname(os.path.abspath(__file__))

    # In das Verzeichnis des Skripts wechseln
    os.chdir(script_dir)

    # Liste der zulässigen Skripte mit den entsprechenden Schlafzeiten (in Sekunden)
    scripts_with_sleep_times = {
        'create_iam_role.py': 2,
        'create_iam_policy.py': 2,
        'create_iam_instances_profile.py': 6,
        'create_ec2_instances_prometheus_rds_exporter.py': 5
    }

    # Absolute Pfade für Skripte
    allowed_scripts = {script: os.path.join(script_dir, script) for script in scripts_with_sleep_times}

    for script_name, sleep_time in scripts_with_sleep_times.items():
        try:
            if script_name not in allowed_scripts:
                raise ValueError(f"Script {script_name} is not allowed.")

            script_path = allowed_scripts[script_name]
            command = ['python3', script_path]
            subprocess.run(command, check=True)

            # Pause für eine bestimmte Zeit, bevor mit dem nächsten Skript fortgefahren wird
            time.sleep(sleep_time)

        except (subprocess.CalledProcessError, ValueError) as e:
            # Behandeln Sie den Fehler, wenn das Skript fehlschlägt oder nicht erlaubt ist
            print(f"Error when executing: {script_name}: {e}")
