import boto3
import datetime
import os
import configparser

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

def restore_latest_manual_snapshot(db_instance_identifier, new_db_instance_identifier):
    # Erstellen Sie eine RDS-Client-Instanz
    rds_client = boto3.client('rds')
    
    # Abrufen aller manuellen Snapshots
    snapshots = rds_client.describe_db_snapshots(
        SnapshotType='manual',
        DBInstanceIdentifier=db_instance_identifier
    )

    # Filtern und Sortieren der Snapshots nach Erstellungszeit
    sorted_snapshots = sorted(
        snapshots['DBSnapshots'],
        key=lambda x: x['SnapshotCreateTime'],
        reverse=True
    )
    
    if not sorted_snapshots:
        print("Keine manuellen Snapshots gefunden.")
        return

    # Neuesten Snapshot auswählen
    latest_snapshot = sorted_snapshots[0]
    latest_snapshot_id = latest_snapshot['DBSnapshotIdentifier']
    print(f"Neuesten manuellen Snapshot gefunden: {latest_snapshot_id}")

    # Wiederherstellen des Snapshots
    response = rds_client.restore_db_instance_from_db_snapshot(
        DBInstanceIdentifier=new_db_instance_identifier,
        DBSnapshotIdentifier=latest_snapshot_id
    )

    print(f"Datenbankinstanz {new_db_instance_identifier} wird aus Snapshot {latest_snapshot_id} wiederhergestellt.")
    return response

if __name__ == "__main__":
    # Geben Sie hier die aktuelle und die neue DB-Instanz-ID an
    original_db_instance_identifier = RDS_DB_INSTANCE_IDENTIFIER
    new_db_instance_identifier = RDS_DB_INSTANCE_IDENTIFIER_RESTORE
    
    restore_latest_manual_snapshot(original_db_instance_identifier, new_db_instance_identifier)
