import boto3
import os
import configparser
from botocore.exceptions import ClientError
import requests

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
config.read(CONFIG_FILE)

# AWS-Konfiguration
RDS_DB_INSTANCE_IDENTIFIER_RESTORE = config['RDS']['RDS_DB_INSTANCE_IDENTIFIER_RESTORE']  # EC2-Instanzname


def delete_rds_instance(instance_identifier):
    # Erstellen einer RDS-Client-Instanz
    rds_client = boto3.client('rds')

    try:
        # Lösch-Parameter vorbereiten
        delete_params = {
            'DBInstanceIdentifier': instance_identifier,
            'SkipFinalSnapshot': True,
        }

        # Löschen der RDS-Instanz
        response = rds_client.delete_db_instance(**delete_params)
        
        # Warten, bis die Instanz den Status 'deleted' erreicht
        waiter = rds_client.get_waiter('db_instance_deleted')
        waiter.wait(DBInstanceIdentifier=instance_identifier)
        
        print(f"RDS-Instanz '{instance_identifier}' wurde erfolgreich gelöscht.")
    except Exception as e:
        print(f"Fehler beim Löschen der RDS-Instanz: {e}")

if __name__ == "__main__":
    # Instanz-Identifikator
    instance_identifier = RDS_DB_INSTANCE_IDENTIFIER_RESTORE
    
    delete_rds_instance(instance_identifier)

