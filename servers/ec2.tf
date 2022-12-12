data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonicalq

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  for_each      = toset(var.instance_types)
  instance_type = each.value
  # count         = var.servers

  tags = {
    Name = "HelloWorld!"
  }
}

resource "aws_eip" "ip" {
  count      = var.servers
  vpc        = true
  depends_on = [aws_instance.web]
}

# resource "aws_eip_association" "ip" {
#   count               = var.servers
#   instance_id         = aws_instance.web[count.index].id
#   allocation_id       = aws_eip.ip[count.index].id
#   allow_reassociation = true
#   depends_on          = [aws_eip.ip]
# }
