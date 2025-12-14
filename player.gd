extends CharacterBody2D

var speed := 8000

func _physics_process(delta: float) -> void:
	
	if not Info.stop:
		move(delta)
	else:
		velocity = Vector2(0, 0)
	
	
	move_and_slide()

func move(delta):
	var direction := Vector2(
	Input.get_axis("ui_left", "ui_right"),
	Input.get_axis("ui_up", "ui_down")
	)
	
	if direction != Vector2.ZERO:
		velocity = direction.normalized() * speed * delta
	else:
		velocity = Vector2.ZERO
