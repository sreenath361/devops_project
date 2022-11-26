resource "aws_efs_file_system" "efs-filesystem" {
  creation_token = "testefstoken"

  tags = {
    Name = var.efsname
  }
}

resource "aws_efs_mount_target" "alpha" {
  count = "${length(var.subnets)}"
  file_system_id = aws_efs_file_system.efs-filesystem.id
  subnet_id      = "${element(var.subnets, count.index)}"
  security_groups = [var.sg]
}
