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
config = configparser.ConfigParser()
if not os.path.isfile(CONFIG_FILE):
  print(f'ERROR: Configuration file not found. Exit Script')
  exit()
config.sections()
config.read(CONFIG_FILE)

# Ermittelt das Verzeichnis des Skripts
script_directory = os.path.dirname(os.path.abspath(__file__))
os.chdir(script_directory)

# AWS-Konfiguration
RDS_AWS_REGION = config['DEFAULT']['AWS_REGION']  # AWS-Region
EC2_AWS_INSTANCE_ID = config['EC2']['EC2_INSTANCE_ID']  # EC2-Instanz-ID
IAM_ROLE_NAME = config['IAM']['IAM_ROLE_NAME']  # IAM-Rollennamen

# Initialisieren Sie den EC2-Client
ec2_client = boto3.client('ec2', region_name=RDS_AWS_REGION)

try:
    # Verknüpfen des IAM-Instance-Profiles mit der EC2-Instanz
    response = ec2_client.associate_iam_instance_profile(
        IamInstanceProfile={
            'Name': IAM_ROLE_NAME
        },
        InstanceId=EC2_AWS_INSTANCE_ID
    )
    print(f"IAM Instance Profile {IAM_ROLE_NAME} wurde erfolgreich mit der EC2-Instanz {EC2_AWS_INSTANCE_ID} verknüpft.")

except ClientError as e:
    print(f'Fehler beim Verknüpfen des IAM Instance Profiles: {e}')
