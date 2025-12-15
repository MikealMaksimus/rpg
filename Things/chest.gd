extends Node2D

@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "start"

var battle = preload("res://fight.tscn")

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		var b = battle.instantiate()
		b.enemy = preload("res://Enemies/test_enemy.tscn")
		get_tree().get_root().add_child(b)
		Info.battle = true
		#DialogueManager.show_dialogue_balloon(dialogue_resource, dialogue_start)
