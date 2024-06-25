#!/usr/bin/python3.10
import boto3
import os
import sys
import configparser
from botocore.exceptions import ClientError

# Den Verzeichnispfad des aktuellen Skripts ermitteln
script_dir = os.path.dirname(os.path.abspath(__file__))

# In das Verzeichnis des Skripts wechseln
os.chdir(script_dir)

# Konfigurationsdatei importieren
CONFIG_FILE = "config.ini"
if not os.path.isfile(CONFIG_FILE):
    print(f'ERROR: Konfigurationsdatei nicht gefunden. Skript wird beendet.')
    sys.exit(1)

config = configparser.ConfigParser()
config.read(CONFIG_FILE)

# Überprüfen, ob die notwendigen Sektionen und Optionen vorhanden sind
if 'DEFAULT' not in config or 'RDS' not in config:
    print('ERROR: Konfigurationssektionen nicht gefunden. Skript wird beendet.')
    sys.exit(1)

if not all(option in config['DEFAULT'] for option in ['AWS_REGION']) or not all(option in config['RDS'] for option in ['RDS_DB_INSTANCE_IDENTIFIER', 'RDS_DB_INSTANCE_CLASS_NEW', 'RDS_DB_ALLOCATED_STORAGE_NEW']):
    print('ERROR: Fehlende Konfigurationsoptionen. Skript wird beendet.')
    sys.exit(1)

# AWS Konfiguration
AWS_REGION = config['DEFAULT']['AWS_REGION']
RDS_DB_INSTANCE_IDENTIFIER = config['RDS']['RDS_DB_INSTANCE_IDENTIFIER']
RDS_DB_INSTANCE_CLASS_NEW = config['RDS']['RDS_DB_INSTANCE_CLASS_NEW']
RDS_DB_ALLOCATED_STORAGE_NEW = int(config['RDS']['RDS_DB_ALLOCATED_STORAGE_NEW'])  # Konvertierung in Integer

def scale_rds_instance(region, db_instance_id, instance_class, allocated_storage):
    # Verbindung zum RDS-Dienst herstellen
    rds_client = boto3.client('rds', region_name=region)

    try:
        # RDS-Instanz skalieren
        response = rds_client.modify_db_instance(
            DBInstanceIdentifier=db_instance_id,
            DBInstanceClass=instance_class,
            AllocatedStorage=allocated_storage,
            ApplyImmediately=True  # Änderungen sofort anwenden
        )
        print("Anfrage zur Skalierung der RDS-Instanz erfolgreich.")
        return response
    except ClientError as e:
        print(f"Fehler bei der Skalierung der RDS-Instanz: {e.response['Error']['Message']}")
        return None

if __name__ == "__main__":
    # Aufruf der Skalierungsfunktion
    response = scale_rds_instance(AWS_REGION, RDS_DB_INSTANCE_IDENTIFIER, RDS_DB_INSTANCE_CLASS_NEW, RDS_DB_ALLOCATED_STORAGE_NEW)
    if response:
        print("RDS-Instanz erfolgreich modifiziert:")
    else:
        print("Fehler bei der Modifikation der RDS-Instanz.")
