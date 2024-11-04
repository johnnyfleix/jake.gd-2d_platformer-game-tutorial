extends KinematicBody2D

var velocity = Vector2(0,0)
const SPEED = 150
const GRAVITY = 35
const JUMPFORCE = -950

func _physics_process(delta):
	if Input.is_action_pressed("right"):
		velocity.x = SPEED
		$Sprite.flip_h = false
		$Sprite.play("walk")
	elif Input.is_action_pressed("left"):
		velocity.x = -SPEED
		$Sprite.flip_h = true
		$Sprite.play("walk")
	else:
		$Sprite.play("idle")
		
	if not is_on_floor():
		$Sprite.play("air")

	velocity.y = velocity.y + GRAVITY
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMPFORCE
	
	velocity = move_and_slide(velocity, Vector2.UP)

	velocity.x = lerp(velocity.x, 0, 0.2)
	#velocity.y = lerp(velocity.y, 0, 0.2)
