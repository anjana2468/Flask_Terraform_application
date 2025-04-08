# Flask Application Deployment with Terraform

This project demonstrates the deployment of a Flask application on an AWS EC2 instance using Terraform for infrastructure provisioning. The Flask app serves a simple website with routes for Home, About, Contact, and a Thank You page.

## Features
### 1. Flask Application: A Python-based web application with pre-designed routes and templates.

### 2.  AWS Infrastructure:
    - EC2 instance with a custom security group.
    - VPC, Subnets, Internet Gateway, and Route Table.

### 3. Automation: Deployment automated with Terraform and remote-exec provisioners.

### 4. Customizable: Modify the app or Terraform configurations to fit your needs.

## Prerequisites
### 1. Software/Tools:
   - Python 3.x
   - Terraform CLI
   - AWS CLI
   - An SSH key pair (e.g., anjana-key-pair.pem)

### 2. Environment:
   - AWS account configured with appropriate permissions.
   - Terraform setup in your local machine.

### 3. Python Packages:
   - Flask (installed via pip or in a virtual environment).

### Project Structure
```
.
├── app.py               # Flask application file
├── static/              # Static assets like CSS
│   └── style.css
├── templates/           # HTML templates
│   ├── home.html
│   ├── about.html
│   ├── contact.html
│   └── thank_you.html
├── terraform/           # Terraform configuration files
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── network.tf       # Network resources
│   └── security.tf      # Security group configuration
└── README.md  
```          
## Deployment Steps
### 1. Clone the Repository
   -  git clone https://github.com/anjana2468/Flask_Terraform_application.git
   -  cd Flask_Terraform_application

## Configure Terraform
### 2. Initialize Terraform:
  -  terraform init

### 3. Deploy AWS Infrastructure
## Apply the Terraform configuration:
  - terraform apply
  - Note the Public IP of the created EC2 instance from the output.

## 4. Access the Flask App
### SSH into the instance:
  ```
  - ssh -i anjana-key-pair.pem ubuntu@<instance-public-ip>
```
### 5. Access the app in your browser:
 ```
- http://<instance-public-ip>:8080
```
### 6. To remove the infrastructure:
 - terraform destroy

## Remote Execution Code
```
- The Terraform provisioner block installs Python, Flask, and runs the Flask application on the EC2 instance:
- provisioner "remote-exec" {
-  inline = [
-    "sudo apt update -y",
-    "sudo apt install -y python3-pip python3-venv",
-    "python3 -m venv /home/ubuntu/venv",
-    "/home/ubuntu/venv/bin/pip install flask",
-    "sudo /home/ubuntu/venv/bin/python /home/ubuntu/app.py > /home/ubuntu/app.log 2>&1 &"
  ]
}
```
# Screenshots:

![Screenshot 2025-04-01 113015](https://github.com/user-attachments/assets/d7f6aebe-27c7-42dd-9bcf-08e803221c74)

![Screenshot 2025-04-01 113035](https://github.com/user-attachments/assets/7aeb3de5-3c01-4098-8685-0d69e7e1b96a)

![Screenshot 2025-04-01 113137](https://github.com/user-attachments/assets/0495aafd-3325-456a-bda0-e7c4eaadee13)

![Screenshot 2025-04-01 113153](https://github.com/user-attachments/assets/eca3c76f-e814-4318-9a56-6dabd350daf7)





License
This project is licensed under the MIT License.

