resource "aws_launch_template" "dev-launch-config" {
  name = "PROD-launch-config"
  vpc_security_group_ids = ["${aws_security_group.ssh-allowed.id}"]
  user_data = filebase64("${"userdata.sh"}") // Userdata is added in the lauch config and launch added to ASG
  # Keep below arguments
  instance_type = "t2.micro"
  image_id = "${lookup(var.AMI, var.AWS_REGION)}"
  key_name = "${aws_key_pair.oregon-region-key-pair.id}"
  #associate_public_ip_address = true

}

// Sends your public key to the instance
resource "aws_key_pair" "oregon-region-key-pair" {
    key_name = "oregon-region-key-pair"
    public_key = "${file(var.PUBLIC_KEY_PATH)}"
}

resource "aws_autoscaling_group" "dev-autoscaling-group-3" {
  name = "dev-asg-3"
  min_size = "1"
  max_size = "1"
  #launch_configuration = "${aws_launch_template.dev-launch-config.name}"
  launch_template {
    id      = aws_launch_template.dev-launch-config.id
    version = "$Latest"
  }
  vpc_zone_identifier = ["${aws_subnet.dev-subnet-public-1.id}"]
  depends_on = [aws_subnet.dev-subnet-public-1]
  tag {
    key                 = "Name"
    value               = "dev-test"
    propagate_at_launch = true
  }
}
