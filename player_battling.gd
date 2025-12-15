extends CharacterBody2D

var hp := 1
var speed := 200
var acc := 30
var dec := 66
var jump := 325
var damage := 2

var gravity := 1500
var direction := 0
var is_attacking := false

var was_on_floor : = false
var is_jumping := false

var combo = 1
var aim = 0
var legs = false


#var attackSound = preload("res://Sounds/sword-sound-2-36274(1).mp3")
#var jumpSound = preload("res://Sounds/hyppy.mp3")
#var laskuSound = preload("res://Sounds/lasku.mp3")
#var hit1 = preload("res://Sounds/hit-swing-sword-small-2-95566(1).mp3")


#var step1 = preload("res://Sounds/Step1.mp3")
#var step2 = preload("res://Sounds/Step2.mp3")
var step = 0

var number = 0

func _physics_process(delta: float) -> void:
	assign()
	
	
	attacking()
	gravital(delta)
	walking()
	jumping()
	
	#animations()
	$Center/Sprite2D.scale
	#Try using tree maybe
	move_and_slide()

func gravital(d):
	if velocity.y > 10:
		velocity.y +=  gravity * d * 1.6
	elif not is_on_floor():
		velocity.y +=  gravity * d
	if is_on_floor():
		$Center/Sprite2D.scale.x = move_toward($Center/Sprite2D.scale.x, 1, 0.7 * d)
		$Center/Sprite2D.scale.y = move_toward($Center/Sprite2D.scale.y, 1, 0.7 * d)
	else:
		$Center/Sprite2D.scale.x = move_toward($Center/Sprite2D.scale.x, 0.9, 0.7 * d)
		$Center/Sprite2D.scale.y = move_toward($Center/Sprite2D.scale.y, 1.1, 0.7 * d)

func attacking():
	if Input.is_action_just_pressed("attack") and $AttackBuffer.is_stopped() or not $AttackBuffer.is_stopped() and $Attack.is_stopped():
		$Attack.start()
		is_attacking = true
		
		#$noSoundCut.play(attackSound, 1, 0)
		
		if combo == 1:
			combo = 2
		else:
			combo = 1
		
		if Input.is_action_pressed("up"):
			aim = 1
		elif Input.is_action_pressed("down") and not is_on_floor():
			aim = -1
		else:
			aim = 0
		
	elif Input.is_action_just_pressed("attack"):
		$AttackBuffer.start()

func jumping():
		var on_floor := is_on_floor()
	
		if Input.is_action_just_pressed("jump") and on_floor or Input.is_action_just_pressed("jump") and not $Coyote.is_stopped() or Input.is_action_pressed("jump") and on_floor and not $JumpBuffer.is_stopped():
			if not is_jumping:
				#$Sound.play(jumpSound, 0, 0, 0.15)
				$Center/Sprite2D.scale = Vector2(0.8, 1.2)
				velocity.y = -jump
				is_jumping = true
				$StillJumping.start()
		
		if Input.is_action_just_pressed("jump") and not on_floor:
			$JumpBuffer.start()

		if on_floor:
			is_jumping = false
			if not was_on_floor: #Osu maahan
				#$Sound.play(fallingSound, 0.5, 0, 0.15)
				$Center/Sprite2D.scale = Vector2(1.2, 0.8)

		if was_on_floor != on_floor: #Poistut maalta
			$Coyote.start()
		was_on_floor = on_floor


func walking():
	direction = Input.get_axis("left", "right")
	if direction > 0:
		direction = 1
	elif direction < 0:
		direction = -1
	
	if direction == 1 and velocity.x < speed:
		velocity.x =  move_toward(velocity.x, speed, acc)
		$Center.scale.x = 1
	elif direction == -1 and velocity.x > -speed:
		velocity.x =  move_toward(velocity.x, speed * -1, acc)
		$Center.scale.x = -1
	else:
		velocity.x =  move_toward(velocity.x, 0, dec)


func leg():
	if not is_on_floor() and velocity.y < 0:
		$Center/Legs/AnimationPlayer.play("Up")
		
	elif not is_on_floor():
		$Center/Legs/AnimationPlayer.play("Down")
	
	elif not velocity.x == 0:
		$Center/Legs/AnimationPlayer.play("Run")
	else:
		$Center/Legs/AnimationPlayer.play("Stand")

func _on_attacks_area_entered(area: Area2D) -> void:
	
	
	if aim == -1:
		velocity.y = -250

#func walkSound():
	#if $WalkSoudCool.is_stopped():
		#$WalkSoudCool.start()
		#if step == 0:
		#	$noSoundCut.play(step1, 1, -20)
		#	step = 1
		#else:
		#	$noSoundCut.play(step2, 1.1, -24)
		#	step = 0

func assign():
	match number:
		
		1:
			Info.hp1 = hp
		2:
			Info.hp2 = hp
		3:
			Info.hp3 = hp
		4:
			Info.hp4 = hp

#func hit():
	#$noSoundCut.play(hit1,1,5)
