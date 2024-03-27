resource "docker_image" "my_image"{
	name = "sauravr/node-app:latest"
	keep_locally = false
}

resource "docker_container" "my_container"{
	image = docker_image.my_image.name
	name = "node-app"
	ports{
		internal=8000
		external=8000
	}
	depends_on = [docker_image.my_image]
}
