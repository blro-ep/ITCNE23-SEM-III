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
RDS_AWS_REGION = config['DEFAULT']['AWS_REGION'] # AWS-Region
EC2_INSTANCE_TYPE = config['EC2']['EC2_INSTANCE_TYPE'] # EC2-Instanztyp
EC2_AMI_ID = config['EC2']['EC2_AMI_ID'] # AMI-ID
EC2_INSTANCE_NAME = config['EC2']['EC2_INSTANCE_NAME'] # EC2-Instanzname
key_name = 'test'  # Ersetzen Sie durch ein vorhandenes Schlüsselpaar

# Pfad zum .deb-Paket
deb_package_url = 'https://github.com/qonto/prometheus-rds-exporter/releases/download/0.10.0/prometheus-rds-exporter_0.10.0_amd64.deb'

# Cloud-init Benutzerdaten-Skript zum Herunterladen und Installieren des .deb-Pakets
user_data_script = f"""#!/bin/bash
sudo apt-get update
wget {deb_package_url} -O /tmp/prometheus-rds-exporter.deb
sudo dpkg -i /tmp/prometheus-rds-exporter.deb
"""

# Initialisieren Sie den EC2-Client
ec2_client = boto3.client('ec2', region_name=RDS_AWS_REGION)

try:
    # Erstellen Sie die EC2-Instanz
    response = ec2_client.run_instances(
        ImageId=EC2_AMI_ID,
        InstanceType=EC2_INSTANCE_TYPE,
        KeyName=key_name,
        MinCount=1,
        MaxCount=1,
        UserData=user_data_script,
        TagSpecifications=[
            {
                'ResourceType': 'instance',
                'Tags': [
                    {'Key': 'Name', 'Value': 'EC2_INSTANCE_NAME'}
                ]
            }
        ]
    )

    instance_id = response['Instances'][0]['InstanceId']
    print(f'EC2 Instance {instance_id} wurde erfolgreich erstellt.')

except ClientError as e:
    print(f'Fehler beim Erstellen der EC2-Instanz: {e}')
