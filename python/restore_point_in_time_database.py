import boto3
import datetime
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
RDS_DB_INSTANCE_IDENTIFIER_RESTORE = config['RDS']['RDS_DB_INSTANCE_IDENTIFIER_RESTORE']
restore_time = '2024-06-09T11:57:00+02:00'  # Specify the point in time you want to restore to

# AWS RDS Client
rds_client = boto3.client('rds')

try:
    response = rds_client.restore_db_instance_to_point_in_time(
        SourceDBInstanceIdentifier=RDS_DB_INSTANCE_IDENTIFIER,
        TargetDBInstanceIdentifier=RDS_DB_INSTANCE_IDENTIFIER_RESTORE,
        RestoreTime=restore_time,
        UseLatestRestorableTime=False
    )
    print(f'Database instance restored to {restore_time}: {response}')
except Exception as e:
    print(f'Error restoring database instance: {e}')
