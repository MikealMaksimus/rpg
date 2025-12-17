extends Node2D

func changeScene(scene):
	get_child(0).queue_free()
	add_child(scene)
