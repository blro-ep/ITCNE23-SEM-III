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
config = configparser.ConfigParser()
if not os.path.isfile(CONFIG_FILE):
  print(f'ERROR: Configuration file not found. Exit Script')
  exit()
config.sections()
config.read(CONFIG_FILE)

# RDS Variablen
RDS_DB_HOST = config['RDS']['RDS_DB_HOST'] # RDS-Endpunkt
RDS_DB_INSTANCE_IDENTIFIER = config['RDS']['RDS_DB_INSTANCE_IDENTIFIER'] # Eindeutiger Name für die Instanz
RDS_DB_DATABASE_NAME = config['RDS']['RDS_DB_DATABASE_NAME'] # Datenbankname
RDS_DB_MASTER_USERNAME = config['RDS']['RDS_DB_MASTER_USERNAME'] # Master-Benutzername
RDS_DB_MASTER_PASSWORD = config['RDS']['RDS_DB_MASTER_PASSWORD'] # Master-Passwort
RDS_DB_MYSQL_IMPORT_SCRIPT = config['RDS']['RDS_DB_MYSQL_IMPORT_SCRIPT'] # Pfad zum SQL-Skript

# Verbindung RDS-Datenbankinstanz, SQL-Skript ausführen
def run_sql_script(host, user, password, database, script_path):
    connection = pymysql.connect(
        host=host,
        user=user,
        password=password,
        database=database
    )

    cursor = connection.cursor()

    with open(script_path, 'r') as file:
        sql_script = file.read()

    for statement in sql_script.split(';'):
        if statement.strip():
            cursor.execute(statement)
            connection.commit()

    cursor.close()
    connection.close()

    print(f"SQL-Skript {script_path} erfolgreich ausgeführt.")

if __name__ == "__main__":
    host = RDS_DB_HOST
    user = RDS_DB_MASTER_USERNAME
    password = RDS_DB_MASTER_PASSWORD
    database = RDS_DB_DATABASE_NAME
    script_path = RDS_DB_MYSQL_IMPORT_SCRIPT

    run_sql_script(host, user, password, database, script_path)
