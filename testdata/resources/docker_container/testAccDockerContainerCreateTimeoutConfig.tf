resource "docker_container" "test" {
  name    = "test"
  image   = "alpine:latest"
  command = ["sleep", "10"]

  timeouts {
    create = "1s"
  }
}
