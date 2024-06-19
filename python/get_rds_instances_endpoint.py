#!/usr/bin/python3.10
import boto3
import os
import sys
import configparser
import pymysql

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

# RDS Variablen
RDS_DB_INSTANCE_IDENTIFIER = config['RDS']['RDS_DB_INSTANCE_IDENTIFIER'] # Eindeutiger Name für die Instanz


def get_rds_endpoint(db_instance_identifier):
    rds_client = boto3.client('rds')
    try:
        response = rds_client.describe_db_instances(DBInstanceIdentifier=db_instance_identifier)
        db_instances = response['DBInstances']
        if db_instances:
            endpoint = db_instances[0]['Endpoint']['Address']
            return endpoint
        else:
            print("Keine RDS-Instanz mit diesem Identifier gefunden.")
    except Exception as e:
        print(f"Fehler beim Abrufen des Endpunkts: {e}")

if __name__ == "__main__":
    db_instance_identifier = RDS_DB_INSTANCE_IDENTIFIER
    endpoint = get_rds_endpoint(db_instance_identifier)
    if endpoint:
        print(f"DB Instance Identifier: {db_instance_identifier}")
        print(f"Endpoint: {endpoint}")
