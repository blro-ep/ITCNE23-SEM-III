import boto3
import os
import configparser
from botocore.exceptions import ClientError

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
config.read(CONFIG_FILE)

# AWS-Konfiguration
EC2_INSTANCE_NAME = config['EC2']['EC2_INSTANCE_NAME']  # EC2-Instanzname

def delete_ec2_instance_by_name(instance_name):
    # Create a session using Boto3
    session = boto3.Session()
    
    # Create an EC2 resource
    ec2 = session.resource('ec2')
    
    # Create an EC2 client
    ec2_client = session.client('ec2')
    
    # Filter instances by the 'Name' tag
    filters = [
        {
            'Name': 'tag:Name',
            'Values': [instance_name]
        }
    ]
    
    # Find instances with the specified name
    instances = ec2.instances.filter(Filters=filters)
    
    instance_ids = [instance.id for instance in instances]
    
    if not instance_ids:
        print(f"No instances found with the name {instance_name}")
        return
    
    # Terminate the instances
    ec2_client.terminate_instances(InstanceIds=instance_ids)
    
    print(f"Terminating instances: {instance_ids}")

if __name__ == "__main__":
    # Replace 'Prometheus-RDS-Exporter' with the name of the instance you want to delete
    delete_ec2_instance_by_name(EC2_INSTANCE_NAME)
