import os
import time
import boto3
import configparser
from delete_ec2_instances_prometheus_rds_exporter import delete_ec2_instances_prometheus_rds_exporter
from delete_iam_instance_profile import delete_iam_instance_profile
from delete_iam_role import delete_iam_role
from delete_iam_policy import delete_iam_policy 
from botocore.exceptions import ClientError


# Import Konfigurationsdatei
CONFIG_FILE = "config.ini"
if not os.path.isfile(CONFIG_FILE):
  print(f'ERROR: Configuration file not found. Exit Script')
  exit()
config = configparser.ConfigParser()
config.sections()
config.read(CONFIG_FILE)

# AWS-Konfiguration
EC2_INSTANCE_NAME = config['EC2']['EC2_INSTANCE_NAME']  # EC2-Instanzname
IAM_INSTANCE_PROFILE_NAME = config['IAM']['IAM_INSTANCE_PROFILE_NAME'] # IAM-Instanzprofilname
IAM_ROLE_NAME = config['IAM']['IAM_ROLE_NAME']
IAM_POLICY_NAME = config['IAM']['IAM_POLICY_NAME']

def main():
    # Den Verzeichnispfad des aktuellen Skripts ermitteln
    script_dir = os.path.dirname(os.path.abspath(__file__))

    # In das Verzeichnis des Skripts wechseln
    os.chdir(script_dir)

    delete_ec2_instances_prometheus_rds_exporter(EC2_INSTANCE_NAME)
    time.sleep(2)
    delete_iam_instance_profile(IAM_INSTANCE_PROFILE_NAME)
    time.sleep(2)
    delete_iam_role(IAM_ROLE_NAME, IAM_POLICY_NAME)
    time.sleep(2)
    delete_iam_policy(IAM_POLICY_NAME)

    print("Deployment entfernt.")

if __name__ == "__main__":
    main()
