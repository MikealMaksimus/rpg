extends Area2D

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("attack"):
		get_parent().hp -= area.get_parent().get_parent().damage
		if get_parent().hp <= 0:
			get_parent().die()
		else:
			print("hit")
