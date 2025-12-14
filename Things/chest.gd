extends Node2D

@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "start"

func _on_area_2d_body_entered(body: Node2D) -> void:
	DialogueManager.show_dialogue_balloon(dialogue_resource, dialogue_start)
