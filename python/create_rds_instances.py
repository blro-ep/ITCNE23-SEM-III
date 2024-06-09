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
config = configparser.ConfigParser()
if not os.path.isfile(CONFIG_FILE):
  print(f'ERROR: Configuration file not found. Exit Script')
  exit()
config.sections()
config.read(CONFIG_FILE)

# RDS Variablen
RDS_DB_INSTANCE_IDENTIFIER = config['RDS']['RDS_DB_INSTANCE_IDENTIFIER'] # Eindeutiger Name für die Instanz
RDS_DB_INSTANCE_CLASS = config['RDS']['RDS_DB_INSTANCE_CLASS']  # Instanztyp (Free Tier)
RDS_DB_ENGINE = config['RDS']['RDS_DB_ENGINE'] # Datenbank-Engine (MariaDB)
RDS_DB_DATABASE_NAME = config['RDS']['RDS_DB_DATABASE_NAME'] # Datenbankname
RDS_DB_MASTER_USERNAME = config['RDS']['RDS_DB_MASTER_USERNAME'] # Master-Benutzername
RDS_DB_MASTER_PASSWORD = config['RDS']['RDS_DB_MASTER_PASSWORD'] # Master-Passwort
RDS_DB_ALLOCATED_STORAGE = int(config['RDS']['RDS_DB_ALLOCATED_STORAGE']) # Speicherplatz in GB
RDS_DB_SUBNET_GROUP_NAME = config['RDS']['RDS_DB_SUBNET_GROUP_NAME'] # Subnet-Gruppe
RDS_DB_PUBLICLY_ACCESSIBLE = bool(config['RDS']['RDS_DB_PUBLICLY_ACCESSIBLE']) # Öffentlich zugänglich (für Demo-Zwecke)

def create_rds_instance():
    # RDS-Client-Instanz erstellen
    rds_client = boto3.client('rds')

    try:
        # Parameter für die Datenbankinstanz konfigurieren
        instance_params = {
            'DBInstanceIdentifier': RDS_DB_INSTANCE_IDENTIFIER,
            'DBName': RDS_DB_DATABASE_NAME,
            'DBInstanceClass': RDS_DB_INSTANCE_CLASS,  
            'Engine': RDS_DB_ENGINE,  
            'MasterUsername': RDS_DB_MASTER_USERNAME,  
            'MasterUserPassword': RDS_DB_MASTER_PASSWORD,  
            'AllocatedStorage': RDS_DB_ALLOCATED_STORAGE,  
            'DBSubnetGroupName': RDS_DB_SUBNET_GROUP_NAME,  
            'PubliclyAccessible': RDS_DB_PUBLICLY_ACCESSIBLE, 
        }

        # Datenbankinstanz erstellen
        response = rds_client.create_db_instance(**instance_params)

        print("MariaDB-Instanz wird erstellt. Dies kann einige Minuten dauern.")

    except Exception as e:
        print(f"Fehler beim Erstellen der MariaDB-Instanz: {e}")

if __name__ == "__main__":
    create_rds_instance()
