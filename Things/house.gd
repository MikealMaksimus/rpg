extends Node2D

var on := false

var house := preload("res://Worlds/inside_house.tscn")

func _process(_delta: float) -> void:
	if on and Input.is_action_just_pressed("interact"):
		#Lisää mainiin vaihto funktio. TODO
		var h = house.instantiate()
		get_highest_parent(self).changeScene(h)


func _on_door_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		on = true


func _on_door_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		on = false

func get_highest_parent(node: Node) -> Node:
	var current = node
	while current.get_parent() and current.get_parent() != get_tree().root:
		current = current.get_parent()
	return current
