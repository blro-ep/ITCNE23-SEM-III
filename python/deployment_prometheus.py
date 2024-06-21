#!/usr/bin/python3.10
import os
import time
import subprocess
import boto3
from botocore.exceptions import ClientError

# Den Verzeichnispfad des aktuellen Skripts ermitteln
script_dir = os.path.dirname(os.path.abspath(__file__))

# In das Verzeichnis des Skripts wechseln
os.chdir(script_dir)

# List of script to run with their corresponding sleep times (in seconds)
scripts_with_sleep_times = {
    'create_iam_role.py': 2,
    'create_iam_policy.py': 2,
    'create_iam_instances_profile.py': 6,
    'create_ec2_instances_prometheus_rds_exporter.py': 5
}

for script_name, sleep_time in scripts_with_sleep_times.items():
    try:
        # Command to run the script
        command = ['python3', script_name]

        # Run the script
        subprocess.run(command, check=True)

        # Sleep for defined time before proceeding to the next script
        time.sleep(sleep_time)

    except subprocess.CalledProcessError as e:
        # Handle the error if the script fails
        print(f"Error when executing: {script_name}: {e}")
