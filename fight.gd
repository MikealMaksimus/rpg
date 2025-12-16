extends Node2D

var enemy : PackedScene

func _ready() -> void:
	var e = enemy.instantiate()
	add_child(e)
	e.global_position = $Marker2D.global_position

func battleWon():
	Info.battle = false
	Info.stop = false
	queue_free()
