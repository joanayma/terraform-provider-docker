resource "docker_image" "foo" {
  name = "nginx:latest"
}

resource "docker_container" "foo" {
  name  = "tf-test"
  image = docker_image.foo.image_id

  group_add = [
    100
  ]

  lifecycle {
    ignore_changes = [network_mode]
  }
}
