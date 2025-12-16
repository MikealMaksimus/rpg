extends Node2D

var on := false

var house := preload("res://Worlds/inside_house.tscn")

func _process(_delta: float) -> void:
	if on and Input.is_action_just_pressed("interact"):
		#Lisää mainiin vaihto funktio. TODO
		var h = house.instantiate()
		get_tree().get_root().add_child(h)
		print("aa")


func _on_door_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		on = true


func _on_door_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		on = false
