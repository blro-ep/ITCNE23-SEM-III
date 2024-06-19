import boto3
from botocore.exceptions import ClientError
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
  print(f'ERROR: Configuration file not found. Exit Script')
  exit()
config = configparser.ConfigParser()
config.sections()
config.read(CONFIG_FILE)

# RDS Variablen
RDS_DB_INSTANCE_IDENTIFIER = config['RDS']['RDS_DB_INSTANCE_IDENTIFIER'] # Eindeutiger Name für die Instanz


# RDS-Client erstellen
rds_client = boto3.client('rds')

# Parameter
db_instance_identifier = RDS_DB_INSTANCE_IDENTIFIER  
snapshot_identifier = f"{db_instance_identifier}-snapshot-{datetime.datetime.now().strftime('%Y-%m-%d-%H-%M-%S')}"

def create_rds_snapshot(db_instance_identifier, snapshot_identifier):
    try:
        response = rds_client.create_db_snapshot(
            DBInstanceIdentifier=db_instance_identifier,
            DBSnapshotIdentifier=snapshot_identifier
        )
        print(f"Snapshot {snapshot_identifier} für die RDS-Instanz {db_instance_identifier} wird erstellt.")
        return response
    except ClientError as e:
        print(f"Fehler beim Erstellen des Snapshots: {e}")
        return None

if __name__ == "__main__":
    create_rds_snapshot(db_instance_identifier, snapshot_identifier)
