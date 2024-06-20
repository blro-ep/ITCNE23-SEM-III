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

# List of script to run
script_names = ['create_iam_role.py', 'create_iam_policy.py', 'create_iam_instances_profile.py','create_ec2_instances_prometheus_rds_exporter.py']

for script_name in script_names:
    try:
        # Command to run the script
        command = ['python3', script_name]

        # Run the script
        subprocess.run(command, check=True)
        time.sleep(5)

    except subprocess.CalledProcessError as e:
        # Handle the error if the script fails
        print(f"Error when executing: {script_name}: {e}")