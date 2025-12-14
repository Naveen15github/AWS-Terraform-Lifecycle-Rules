# ==============================
# Random Resources
# ==============================

resource "random_string" "name_suffix" {
  length  = 6
  upper   = false
  special = false
}

resource "random_id" "unique_id" {
  byte_length = 4
}

resource "random_integer" "random_port" {
  min = 10000
  max = 60000
}

# ==============================
# Data Sources
# ==============================

data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# ==============================
# EC2 Instance
# ==============================

resource "aws_instance" "web_server" {
  ami           = data.aws_ami.amazon_linux_2.id
  instance_type = var.instance_type

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name        = "web-${random_string.name_suffix.result}"
    Environment = var.environment
    UniqueID    = random_id.unique_id.hex
  }
}
