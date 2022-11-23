resource "aws_launch_configuration" "dev-launch-config" {

  name = "dev-launch-config"
  security_groups = ["${aws_security_group.ssh-allowed.id}"]
  user_data = "${file("userdata.sh")}"  // Userdata is added in the lauch config and launch added to ASG
  # Keep below arguments
  instance_type = "t2.micro"
  image_id = "${lookup(var.AMI, var.AWS_REGION)}"
  key_name = "${aws_key_pair.oregon-region-key-pair.id}"
  associate_public_ip_address = true

}

// Sends your public key to the instance
resource "aws_key_pair" "oregon-region-key-pair" {
    key_name = "oregon-region-key-pair"
    public_key = "${file(var.PUBLIC_KEY_PATH)}"
}

resource "aws_autoscaling_group" "dev-autoscaling-group" {
  name = "dev-asg"
  min_size = "1"
  max_size = "1"
  launch_configuration = "${aws_launch_configuration.dev-launch-config.name}"
  vpc_zone_identifier = ["${aws_subnet.dev-subnet-public-1.id}"]
  depends_on = [aws_subnet.dev-subnet-public-1]
  tag {
    key                 = "Name"
    value               = "dev-test"
    propagate_at_launch = true
  }
}