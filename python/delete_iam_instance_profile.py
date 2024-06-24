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
IAM_INSTANCE_PROFILE_NAME = config['IAM']['IAM_INSTANCE_PROFILE_NAME']

# Erstelle eine Boto3 IAM Client
iam = boto3.client('iam')

def delete_iam_instance_profile(IAM_INSTANCE_PROFILE_NAME):
    try:
        # Zuerst die Rollen abrufen, die dem Instance Profile zugeordnet sind
        response = iam.get_instance_profile(InstanceProfileName=IAM_INSTANCE_PROFILE_NAME)
        
        # Liste der Rollen, die dem Instance Profile zugeordnet sind, durchlaufen und löschen
        for role in response['InstanceProfile']['Roles']:
            iam.remove_role_from_instance_profile(InstanceProfileName=IAM_INSTANCE_PROFILE_NAME, RoleName=role['RoleName'])
            
        # Dann das Instance Profile selbst löschen
        iam.delete_instance_profile(InstanceProfileName=IAM_INSTANCE_PROFILE_NAME)
        
        print(f"Instance Profile {IAM_INSTANCE_PROFILE_NAME} erfolgreich gelöscht.")
        
    except iam.exceptions.NoSuchEntityException:
        print(f"Instance Profile {IAM_INSTANCE_PROFILE_NAME} nicht gefunden.")
    
    except Exception as e:
        print(f"Fehler beim Löschen des Instance Profiles: {e}")

if __name__ == "__main__":
    delete_iam_instance_profile(IAM_INSTANCE_PROFILE_NAME)
