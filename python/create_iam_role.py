import os
import boto3
import sys
import json
import configparser
from botocore.exceptions import ClientError

# Den Verzeichnispfad des aktuellen Skripts ermitteln
script_dir = os.path.dirname(os.path.abspath(__file__))

# In das Verzeichnis des Skripts wechseln
os.chdir(script_dir)

# Import Konfigurationsdatei
CONFIG_FILE = "config.ini"
config = configparser.ConfigParser()
if not os.path.isfile(CONFIG_FILE):
  print(f'ERROR: Configuration file not found. Exit Script')
  exit()
config.sections()
config.read(CONFIG_FILE)

# Ermittelt das Verzeichnis des Skripts
script_directory = os.path.dirname(os.path.abspath(__file__))
os.chdir(script_directory)

# IAM Role Name
IAM_ROLE_NAME = 'prometheus-rds-exporter'

# Vertrauensrichtlinie
trust_policy = {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": { "Service": "ec2.amazonaws.com"},
            "Action": "sts:AssumeRole"
        }
    ]
}

# Initialisieren Sie den boto3-Client
iam_client = boto3.client('iam')

# Erstellen Sie die IAM-Rolle
try:
    response = iam_client.create_role(
        RoleName=IAM_ROLE_NAME,
        AssumeRolePolicyDocument=json.dumps(trust_policy)
    )
    print(f"IAM Role {IAM_ROLE_NAME} wurde erfolgreich erstellt.")
except ClientError as e:
    print(f"Fehler beim Erstellen der IAM-Rolle: {e}")