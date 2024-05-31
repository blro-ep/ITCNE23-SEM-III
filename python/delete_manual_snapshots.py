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
RDS_AWS_REGION = config['DEFAULT']['AWS_REGION'] # AWS-Region

def delete_manual_snapshots():
    # Erstellen Sie eine RDS-Client-Instanz
    rds_client = boto3.client('rds')
    
    # Abrufen aller DB-Snapshots
    snapshots = rds_client.describe_db_snapshots(SnapshotType='manual')
    
    # Durchlaufen löschen der manuellen Snapshots
    for snapshot in snapshots['DBSnapshots']:
        snapshot_id = snapshot['DBSnapshotIdentifier']
        print(f"Lösche Snapshot: {snapshot_id}")
        rds_client.delete_db_snapshot(DBSnapshotIdentifier=snapshot_id)
        print(f"Snapshot {snapshot_id} wurde gelöscht.")

if __name__ == "__main__":
    delete_manual_snapshots()
