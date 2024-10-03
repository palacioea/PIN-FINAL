data "template_cloudinit_config" "config" {
  gzip          = true
  base64_encode = true

  dynamic "part" {
    for_each = var.user_data_scripts
    content {
      content_type = "text/x-shellscript"
      content      = file("${path.module}/scripts/${part.value}")
    }
  }
}