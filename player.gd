extends CharacterBody2D

var speed := 5500

func _physics_process(delta: float) -> void:
	
	if not Info.stop:
		move(delta)
	else:
		velocity = Vector2(0, 0)
	
	if Info.battle:
		$Camera2D.enabled = false
	else:
		$Camera2D.enabled = true
	
	
	move_and_slide()

func move(delta):
	var direction := Vector2(
	Input.get_axis("left", "right"),
	Input.get_axis("up", "down")
	)
	
	if direction != Vector2.ZERO:
		velocity = direction.normalized() * speed * delta
	else:
		velocity = Vector2.ZERO
