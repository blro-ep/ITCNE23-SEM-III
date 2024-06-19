import boto3
import sys
import os
import json
import configparser
from botocore.exceptions import ClientError

# Den Verzeichnispfad des aktuellen Skripts ermitteln
script_dir = os.path.dirname(os.path.abspath(__file__))

# In das Verzeichnis des Skripts wechseln
os.chdir(script_dir)

# Import Konfigurationsdatei
CONFIG_FILE = "config.ini"
if not os.path.isfile(CONFIG_FILE):
  print(f'ERROR: Configuration file not found. Exit Script')
  exit()
config = configparser.ConfigParser()
config.sections()
config.read(CONFIG_FILE)

# Ermittelt das Verzeichnis des Skripts
script_directory = os.path.dirname(os.path.abspath(__file__))
os.chdir(script_directory)

# AWS-Konfiguration
IAM_INSTANCE_PROFILE_NAME = config['IAM']['IAM_INSTANCE_PROFILE_NAME']
IAM_ROLE_NAME = config['IAM']['IAM_ROLE_NAME']

# Initialisieren Sie den boto3-Client
iam_client = boto3.client('iam')

# Erstellen Sie das IAM Instance Profile
try:
    response = iam_client.create_instance_profile(
        InstanceProfileName=IAM_INSTANCE_PROFILE_NAME
    )
    print(f"IAM Instance Profile {IAM_INSTANCE_PROFILE_NAME} wurde erfolgreich erstellt.")
except ClientError as e:
    if e.response['Error']['Code'] == 'EntityAlreadyExists':
        print(f"IAM Instance Profile {IAM_INSTANCE_PROFILE_NAME} existiert bereits.")
    else:
        print(f"Fehler beim Erstellen des IAM Instance Profiles: {e}")
        exit(1)

# IAM Role zu IAM Instance Profile hinzufügen
try:
    iam_client.add_role_to_instance_profile(
        InstanceProfileName=IAM_INSTANCE_PROFILE_NAME,
        RoleName=IAM_ROLE_NAME
    )
    print(f"IAM Role {IAM_ROLE_NAME} wurde erfolgreich zum Instance Profile {IAM_INSTANCE_PROFILE_NAME} hinzugefügt.")
except ClientError as e:
    print(f"Fehler beim Hinzufügen der IAM-Rolle zum Instance Profile: {e}")
    exit(1)
