resource "aws_instance" "test_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type_value
  key_name      = var.key_name_value
  vpc_security_group_ids = [aws_security_group.websg.id]
  subnet_id     = aws_subnet.Public_Subnet.id
  tags = {
    Name = "test_instance"
  }
  # Specify connection details for SSH
  connection {
    type        = "ssh"
    host        = self.public_ip   # The instance's public IP
    user        = "ubuntu"        # The default username for the AMI
  private_key = file("C:\\Users\\issac\\OneDrive\\Documents\\awslogin.pem")  # Path to your private key
  }
  # Provisioners to copy files and folders
  provisioner "file" {
    source      = "app.py"
    destination = "/home/ubuntu/app.py"
  }
  provisioner "file" {
    source      = "templates"
    destination = "/home/ubuntu/templates"
  }
  provisioner "file" {
    source      = "static"
    destination = "/home/ubuntu/static"
  }
  # Remote-exec provisioner for setup and running the Flask app
  provisioner "remote-exec" {
    inline = [
    "sudo apt update -y",
    "sudo apt-get install -y python3 python3-pip python3-venv",
    "python3 -m venv /home/ubuntu/venv",
    "/home/ubuntu/venv/bin/pip install flask",
    "/home/ubuntu/venv/bin/python /home/ubuntu/app.py > app.log 2>&1 &"                          # Run the Flask app
    ]
  }
}