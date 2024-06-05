import boto3
import os
import configparser
from botocore.exceptions import ClientError
import requests

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
config.read(CONFIG_FILE)

# AWS-Konfiguration
RDS_AWS_REGION = config['DEFAULT']['AWS_REGION']  # AWS-Region
EC2_INSTANCE_TYPE = config['EC2']['EC2_INSTANCE_TYPE']  # EC2-Instanztyp
EC2_AMI_ID = config['EC2']['EC2_AMI_ID']  # AMI-ID
EC2_INSTANCE_NAME = config['EC2']['EC2_INSTANCE_NAME']  # EC2-Instanzname
EC2_PROMETHEUS_EXPORTER = config['EC2']['EC2_PROMETHEUS_EXPORTER']  # EC2 Prometheus Exporter Source
IAM_ROLE_NAME = config['IAM']['IAM_ROLE_NAME']  # IAM-Rolle Name

# Cloud-init Benutzerdaten-Skript zum Herunterladen und Installieren des .deb-Pakets
user_data_script = f"""#cloud-config
package_update: true
package_upgrade: true
package_reboot_if_required: false

ssh_authorized_keys:
  - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDtN+sKx8MaNh5gpulK9plpe1bxHtYfSlj2WOvMM8cjXzUMRxxIxxPivAohTZYsCW9OwK376GclZd17RqDfx9ifoa1rUpQnyZ1ckB4Xw5zZA+bZintl1L0OAwzTmaITXbly7913BNjkiQ9Vyy3gYwYqEKrmQPfhaWKG3oWCWhQHBE9nllYPtnIspupeEGRaS1rJL1NZH7nRE+5dQMXnIr3pRUDbX0q2WXodYtVuUVaujYCGWDTLzgrLgVWRix165pMfXXJ80wmZCz8JC/vcM7veKiKRtbeTHJSMnxCxN9MpKe/PZqLtS3WywzHkBqF2s208SC0bvfUpxrAKGzUresUWT6+EgeoBDs7IsSwFekAerckSMH0CWXdL0triE52gQK+7mWKPh6vvzONngNiwKQuOD6lnbaVuK2DrJ/Oi4aT2+eonA2ovFCP4BHTgSwc/VVh3++Fu944ZsJOV6zK50uopfCVcrjZ7vs2y15DgwrtARQkaSZVIEwVgZG7FN2n4AEkSvotpElxLNuLbmoKimQdJy96YZYcN2skkOVaaPa1zvB18cT/V5+1ctGJ1rG7jrzkoaATjt4DHEONGfNT5VjE5CYteEExmI9uzEpEuKY+jBWbtRily49ESSEZQd3aCS8svDe8jxvs9zC9N7pzh+5O9PgJsUkyHLJANOJNrWyeOYw== outside@XPS

packages:
  - podman
  - podman-compose

runcmd:
  - cd /opt/
  - sudo git clone https://github.com/blro-ep/ITCNE23-SEM-III.git
  - chmod +x /opt/ITCNE23-SEM-III/bash/setPublicIP.sh
  - [ bash, /opt/ITCNE23-SEM-III/bash/setPublicIP.sh ]
  - wget {EC2_PROMETHEUS_EXPORTER} -O /opt/prometheus-rds-exporter.deb
  - sudo dpkg -i /opt/prometheus-rds-exporter.deb
  - cd /opt/ITCNE23-SEM-III/podman/
  - sudo podman-compose up -d
  
"""

# Initialisieren Sie den EC2-Client
ec2_client = boto3.client('ec2', region_name=RDS_AWS_REGION)

try:
    # Erstellen Sie die EC2-Instanz
    response = ec2_client.run_instances(
        ImageId=EC2_AMI_ID,
        InstanceType=EC2_INSTANCE_TYPE,
        MinCount=1,
        MaxCount=1,
        UserData=user_data_script,
        IamInstanceProfile={
            'Name': IAM_ROLE_NAME
        },
        TagSpecifications=[
            {
                'ResourceType': 'instance',
                'Tags': [
                    {'Key': 'Name', 'Value': EC2_INSTANCE_NAME}
                ]
            }
        ]
    )

    instance_id = response['Instances'][0]['InstanceId']
    print(f'EC2 Instance {instance_id} wurde erfolgreich erstellt.')

except ClientError as e:
    print(f'Fehler beim Erstellen der EC2-Instanz: {e}')
