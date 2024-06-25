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
if not os.path.isfile(CONFIG_FILE):
  print(f'ERROR: Konfigurationsdatei nicht gefunden. Skript beenden.')
  exit()
config = configparser.ConfigParser()
config.sections()
config.read(CONFIG_FILE)

# RDS Variablen
RDS_DB_INSTANCE_IDENTIFIER = config['RDS']['RDS_DB_INSTANCE_IDENTIFIER'] # Eindeutiger Name für die Instanz
RDS_DB_INSTANCE_IDENTIFIER_RESTORE = config['RDS']['RDS_DB_INSTANCE_IDENTIFIER_RESTORE'] # Eindeutiger Name für die wiederhergestellte Instanz
RDS_DB_INSTANCE_IDENTIFIER_RESTORE_TIME = config['RDS']['RDS_DB_INSTANCE_IDENTIFIER_RESTORE_TIME'] # Zeitpunkt der Wiederherstellung

# AWS RDS Client
rds_client = boto3.client('rds')

try:
    response = rds_client.restore_db_instance_to_point_in_time(
        SourceDBInstanceIdentifier=RDS_DB_INSTANCE_IDENTIFIER,
        TargetDBInstanceIdentifier=RDS_DB_INSTANCE_IDENTIFIER_RESTORE,
        RestoreTime=RDS_DB_INSTANCE_IDENTIFIER_RESTORE_TIME,
        UseLatestRestorableTime=False
    )
    print(f'Datenbankinstanz wiederhergestellt auf {RDS_DB_INSTANCE_IDENTIFIER_RESTORE_TIME}: {response}')
except Exception as e:
    print(f'Fehler beim Wiederherstellen der Datenbankinstanz: {e}')
