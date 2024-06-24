import os
import time
from create_iam_role import create_iam_role
from create_iam_policy import create_iam_policy
from create_iam_instances_profile import create_iam_instances_profile
from create_ec2_instances_prometheus_rds_exporter import create_ec2_instances_prometheus_rds_exporter

def main():
    # Den Verzeichnispfad des aktuellen Skripts ermitteln
    script_dir = os.path.dirname(os.path.abspath(__file__))

    # In das Verzeichnis des Skripts wechseln
    os.chdir(script_dir)

    create_iam_role()   # Erstellen Sie die IAM-Rolle
    time.sleep(2)
    create_iam_policy()   # Erstellen Sie die IAM-Policy
    time.sleep(2)
    create_iam_instances_profile()  # Erstellen Sie das IAM-Instanzprofil
    time.sleep(6)
    create_ec2_instances_prometheus_rds_exporter()  # Erstellen Sie die EC2-Instanzen mit Prometheus und RDS Exporter
    print("Deployment abgeschlossen.")

if __name__ == "__main__":
    main()