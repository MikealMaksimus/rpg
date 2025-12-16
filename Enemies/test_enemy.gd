extends CharacterBody2D

var hp :=  5
var gravity := 1800

func _process(delta: float) -> void:
	if velocity.y > 10:
		velocity.y +=  gravity * delta * 1.6
	elif not is_on_floor():
		velocity.y +=  gravity * delta
	
	move_and_slide()

func die():
	get_parent().battleWon()
	queue_free()
