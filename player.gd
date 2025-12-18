extends CharacterBody2D

var speed := 5500
var lastDir := Vector2(0, -1)

func _physics_process(delta: float) -> void:
	
	if not Info.stop:
		move(delta)
	else:
		velocity = Vector2(0, 0)
	
	if Info.battle:
		$Camera2D.enabled = false
	else:
		$Camera2D.enabled = true
	
	animation()
	move_and_slide()

func move(delta):
	var direction := Vector2(
	Input.get_axis("left", "right"),
	Input.get_axis("up", "down")
	)
	
	direction.normalized()
	
	if direction != Vector2.ZERO:
		velocity = direction * speed * delta
		lastDir = direction
	else:
		velocity = Vector2.ZERO

func animation():
	$AnimationTree.set("parameters/Idle/blend_position", lastDir)
