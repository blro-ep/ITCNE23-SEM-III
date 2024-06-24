import boto3
import os
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
config.read(CONFIG_FILE)

# AWS-Konfiguration
AWS_ACCOUNT_ID = config['DEFAULT']['AWS_ACCOUNT_ID']
IAM_POLICY_NAME = config['IAM']['IAM_POLICY_NAME']

# Erstelle eine Boto3 IAM Client
iam = boto3.client('iam')

def delete_iam_policy(IAM_POLICY_NAME):
    try:
        # Richtlinie löschen
        iam.delete_policy(PolicyArn=f"arn:aws:iam::{AWS_ACCOUNT_ID}:policy/{IAM_POLICY_NAME}")
        print(f"Richtlinie {IAM_POLICY_NAME} erfolgreich gelöscht.")
    
    except iam.exceptions.NoSuchEntityException:
        print(f"Richtlinie {IAM_POLICY_NAME} nicht gefunden.")
    
    except iam.exceptions.DeleteConflictException as e:
        print(f"Fehler beim Löschen der Richtlinie: {e.response['Error']['Message']}")
    
    except Exception as e:
        print(f"Allgemeiner Fehler beim Löschen der Richtlinie: {e}")

if __name__ == "__main__":
    delete_iam_policy(IAM_POLICY_NAME)
