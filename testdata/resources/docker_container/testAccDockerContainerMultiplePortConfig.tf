resource "docker_image" "foo" {
  name         = "nginx:latest"
  keep_locally = true
}

resource "docker_container" "foo" {
  name  = "tf-test"
  image = docker_image.foo.image_id

  ports {
    internal = 80
    external = 32787
  }

  ports {
    internal = 81
    external = 32788
  }

  lifecycle {
    ignore_changes = [network_mode]
  }
}
