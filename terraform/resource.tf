resource "aws_instance" "WordPress" {
  ami           = "ami-0989fb15ce71ba39e"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.web-cans.id]

  tags = {
    Name = "WordPress"
  }
  
  user_data = "${file("myscript.sh")}"

 
  provisioner "local-exec" {
    command = "echo ${self.public_ip} >> /etc/ansible/hosts"
  }

}
