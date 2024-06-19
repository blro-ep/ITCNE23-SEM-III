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
if not os.path.isfile(CONFIG_FILE):
  print(f'ERROR: Configuration file not found. Exit Script')
  exit()
config = configparser.ConfigParser()
config.sections()
config.read(CONFIG_FILE)

# AWS-Konfiguration
IAM_POLICY_NAME = config['IAM']['IAM_POLICY_NAME']  
IAM_ROLE_NAME = config['IAM']['IAM_ROLE_NAME']

# Download RDS Exporter policy
policy_url = 'https://raw.githubusercontent.com/qonto/prometheus-rds-exporter/main/configs/aws/policy.json'
policy_file = 'prometheus-rds-exporter.policy.json'

response = requests.get(policy_url)
if response.status_code == 200:
    with open(policy_file, 'w') as file:
        file.write(response.text)
    print("Policy erfolgreich heruntergeladen.")
else:
    print(f"Fehler beim Herunterladen der Policy: {response.status_code}")
    exit(1)

# Initialisieren Sie den boto3-Client
iam_client = boto3.client('iam')
sts_client = boto3.client('sts')

# Erstellen Sie die IAM-Policy
try:
    with open(policy_file) as policy_file_data:
        policy_document = json.load(policy_file_data)
    
    create_policy_response = iam_client.create_policy(
        PolicyName=IAM_POLICY_NAME,
        PolicyDocument=json.dumps(policy_document)
    )
    print(f"IAM Policy {IAM_POLICY_NAME} wurde erfolgreich erstellt.")
except ClientError as e:
    print(f"Fehler beim Erstellen der IAM-Policy: {e}")
    exit(1)

# IAM Policy zu IAM Role hinzufügen
try:
    aws_account_id = sts_client.get_caller_identity()["Account"]
    iam_policy_arn = f'arn:aws:iam::{aws_account_id}:policy/{IAM_POLICY_NAME}'
    
    iam_client.attach_role_policy(
        RoleName=IAM_ROLE_NAME,
        PolicyArn=iam_policy_arn
    )
    print(f"IAM Policy {IAM_POLICY_NAME} wurde erfolgreich der Rolle {IAM_ROLE_NAME} hinzugefügt.")
except ClientError as e:
    print(f"Fehler beim Hinzufügen der IAM-Policy zur Rolle: {e}")
    exit(1)
