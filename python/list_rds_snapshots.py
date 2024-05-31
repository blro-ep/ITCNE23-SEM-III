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

def list_rds_snapshots(region_name):
    # RDS-Client erstellen
    rds_client = boto3.client('rds', region_name=region_name)

    # Snapshots auflisten
    try:
        response = rds_client.describe_db_snapshots()
        snapshots = response['DBSnapshots']
        print("Liste der RDS-Snapshots:")
        for snapshot in snapshots:
            print(f"- Snapshot Identifier: {snapshot['DBSnapshotIdentifier']}")
            print(f"  Status: {snapshot['Status']}")
            print(f"  Erstellungszeit: {snapshot['SnapshotCreateTime']}")
            print(f"  Größe: {snapshot['AllocatedStorage']} GB")
            print(f"  RDS-Instanz: {snapshot['DBInstanceIdentifier']}")
            print(f"  Engine: {snapshot['Engine']}")
            print(f"  Snapshot-Typ: {snapshot['SnapshotType']}")
            print()
    except Exception as e:
        print(f"Fehler beim Auflisten der Snapshots: {e}")

if __name__ == "__main__":
    region_name = RDS_AWS_REGION
    list_rds_snapshots(region_name)
