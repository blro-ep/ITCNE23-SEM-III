import boto3
import requests
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
config = configparser.ConfigParser()
if not os.path.isfile(CONFIG_FILE):
  print(f'ERROR: Configuration file not found. Exit Script')
  exit()
config.sections()
config.read(CONFIG_FILE)

# AWS-Konfiguration
aws_account_id = config['DEFAULT']['AWS_ACCOUNT_ID']
policy_name = config['IAM']['IAM_POLICY_NAME']

# Erstelle eine Boto3 IAM Client
iam = boto3.client('iam')

# Versuche die Richtlinie zu löschen
try:
    # Zuerst die Richtlinie löschen
    iam.delete_policy(PolicyArn=f"arn:aws:iam::{aws_account_id}:policy/{policy_name}")
    
    print(f"Richtlinie {policy_name} erfolgreich gelöscht.")
    
except iam.exceptions.NoSuchEntityException:
    print(f"Richtlinie {policy_name} nicht gefunden.")
    
except iam.exceptions.DeleteConflictException as e:
    print(f"Fehler beim Löschen der Richtlinie: {e.response['Error']['Message']}")
    
except Exception as e:
    print(f"Allgemeiner Fehler beim Löschen der Richtlinie: {e}")
