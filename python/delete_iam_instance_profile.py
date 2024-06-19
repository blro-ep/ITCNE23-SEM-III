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
instance_profile_name = config['IAM']['IAM_INSTANCE_PROFILE_NAME']


# Erstelle eine Boto3 IAM Client
iam = boto3.client('iam')

# Versuche das Instance Profile zu löschen
try:
    # Zuerst die Rollen abrufen, die dem Instance Profile zugeordnet sind
    response = iam.get_instance_profile(InstanceProfileName=instance_profile_name)
    
    # Liste der Rollen, die dem Instance Profile zugeordnet sind, durchlaufen und löschen
    for role in response['InstanceProfile']['Roles']:
        iam.remove_role_from_instance_profile(InstanceProfileName=instance_profile_name, RoleName=role['RoleName'])
        
    # Dann das Instance Profile selbst löschen
    iam.delete_instance_profile(InstanceProfileName=instance_profile_name)
    
    print(f"Instance Profile {instance_profile_name} erfolgreich gelöscht.")
    
except iam.exceptions.NoSuchEntityException:
    print(f"Instance Profile {instance_profile_name} nicht gefunden.")

except Exception as e:
    print(f"Fehler beim Löschen des Instance Profiles: {e}")