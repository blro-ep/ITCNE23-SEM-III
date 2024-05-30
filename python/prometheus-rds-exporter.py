#!/usr/bin/python3.10
import boto3
import os
import json
import configparser

# Import Konfigurationsdatei
CONFIG_FILE = "config.ini"
config = configparser.ConfigParser()

if not os.path.isfile(CONFIG_FILE):
  print(f'ERROR: Configuration file not found. Exit Script')
  exit()
config.sections()
config.read(CONFIG_FILE)


# Verbindung zu AWS herstellen
iam_client = boto3.client('iam')

# Rolle erstellen
role_name = 'prometheus-rds-exporter'

# Annahmepolitik aus der Datei lesen
with open('prometheus-rds-exporter.policy.json', 'r') as file:
    assume_role_policy_document = json.load(file)

response = iam_client.create_role(
    RoleName=role_name,
    AssumeRolePolicyDocument=json.dumps(assume_role_policy_document)
)

print(response)
