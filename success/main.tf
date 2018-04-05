resource "local_file" "foo" {
  content  = "food"
  filename = "${path.module}/foo.bar"
}

data "local_file" "foo_bar" {
  filename   = "${path.module}/foo.bar"
  depends_on = ["local_file.foo"]
}

resource "null_resource" "lol" {
  triggers = {
    foo_file = "${data.local_file.foo_bar.content}"
  }

  provisioner "local-exec" {
    command = "echo ${path.module}/foo.bar"
  }
}
