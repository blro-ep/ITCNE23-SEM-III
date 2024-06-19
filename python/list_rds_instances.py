#!/usr/bin/python3.10
import boto3
import os
import sys
import configparser

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

def list_rds_instances():
    # Erstellen einer RDS-Client-Instanz
    rds_client = boto3.client('rds')

    try:
        # Abrufen der Liste der DB-Instances
        response = rds_client.describe_db_instances()

        # Überprüfen, ob DB-Instances vorhanden sind
        if 'DBInstances' in response:
            db_instances = response['DBInstances']
            if len(db_instances) == 0:
                print("Keine RDS-Instanzen gefunden.")
            else:
                print("RDS-Instanzen:")
                for instance in db_instances:
                    if instance['DBInstanceIdentifier'] == RDS_DB_INSTANCE_IDENTIFIER:
                        print(f"DB Instance Identifier: {instance['DBInstanceIdentifier']}")
                        print(f"DB Instance Class: {instance['DBInstanceClass']}")
                        print(f"Engine: {instance['Engine']}")
                        print(f"DB Instance Status: {instance['DBInstanceStatus']}")
                        print(f"DB Instance Endpoint: {instance['Endpoint']['Address']}")
                        print("------")
                    else:
                        print(f"RDS Instanz nicht vorhanden: {instance['DBInstanceIdentifier']}")
                        print("------")
        else:
            print("Keine RDS-Instanzen gefunden.")
    except Exception as e:
        print(f"Fehler beim Abrufen der RDS-Instanzen: {e}")

if __name__ == "__main__":
    list_rds_instances()
