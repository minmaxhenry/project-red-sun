extends CharacterBody2D

const baseSpeed = 500.0
const sprintSpeedMult = 2

func get_movment():
	var currentSpeed = baseSpeed
	var input_direction = Input.get_vector("left", "right", "up", "down")
	if Input.is_action_pressed("sprint"):
		currentSpeed = baseSpeed * sprintSpeedMult
	velocity = input_direction * currentSpeed

func get_look_sprite():
	var lookDirection = get_global_mouse_position()
	var playerPosition = global_position
	
	var triangleXY = [lookDirection.x-playerPosition.x, playerPosition.y-lookDirection.y]
	
	var lookVector = Vector2(lookDirection.x-playerPosition.x, playerPosition.y-lookDirection.y)
	var lookVAngleR =  lookVector.angle() + PI
	#var lookVAngleR =  atan2(triangleXY[0], triangleXY[1]) + PI
	
	var angle = ((180/PI)*lookVAngleR)+0
	var quadrant: int = (angle+45)/90
	print(quadrant)
	look_at(lookDirection)

func _physics_process(delta):
	get_movment()
	get_look_sprite()
	move_and_slide()
