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

# AWS-Konfiguration
aws_account_id = config['DEFAULT']['AWS_ACCOUNT_ID']
role_name = config['IAM']['IAM_ROLE_NAME']
policy_name = config['IAM']['IAM_POLICY_NAME']

# Erstelle eine Boto3 IAM Client
iam = boto3.client('iam')

# Versuche die Policy von der Rolle zu entfernen
try:
    iam.detach_role_policy(RoleName=role_name, PolicyArn=f"arn:aws:iam::{aws_account_id}:policy/{policy_name}")
    print(f"Policy {policy_name} erfolgreich von Rolle {role_name} entfernt.")
    
    # Nachdem die Policy erfolgreich entfernt wurde, versuche die Rolle zu löschen
    try:
        iam.delete_role(RoleName=role_name)
        print(f"Rolle {role_name} erfolgreich gelöscht.")
        
    except iam.exceptions.NoSuchEntityException:
        print(f"Rolle {role_name} nicht gefunden.")
        
    except iam.exceptions.DeleteConflictException as e:
        print(f"Fehler beim Löschen der Rolle: {e.response['Error']['Message']}")
        
    except Exception as e:
        print(f"Allgemeiner Fehler beim Löschen der Rolle: {e}")
    
except iam.exceptions.NoSuchEntityException:
    print(f"Policy {policy_name} nicht gefunden oder bereits von Rolle {role_name} entfernt.")
    
except iam.exceptions.DeleteConflictException as e:
    print(f"Fehler beim Entfernen der Policy von der Rolle: {e.response['Error']['Message']}")
    
except Exception as e:
    print(f"Allgemeiner Fehler beim Entfernen der Policy von der Rolle: {e}")
