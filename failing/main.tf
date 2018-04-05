resource "local_file" "foo" {
  content  = "food"
  filename = "${path.module}/foo.bar"
}

resource "null_resource" "lol" {
  triggers = {
    foo_file = "${file("${path.module}/foo.bar")}"
  }

  provisioner "local-exec" {
    command = "echo ${path.module}/foo.bar"
  }
}
