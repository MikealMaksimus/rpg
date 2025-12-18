extends Area2D

@export var scene: PackedScene

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		var s = scene.instantiate()
		get_highest_parent(self).changeScene(s)

func get_highest_parent(node: Node) -> Node:
	var current = node
	while current.get_parent() and current.get_parent() != get_tree().root:
		current = current.get_parent()
	return current
