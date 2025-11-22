extends CharacterBody2D

const baseSpeed = 500.0
const sprintSpeedMult = 2

func get_movment():
	var currentSpeed = baseSpeed
	var input_direction = Input.get_vector("left", "right", "up", "down")
	if Input.is_action_pressed("sprint"):
		currentSpeed = baseSpeed * sprintSpeedMult
	velocity = input_direction * currentSpeed

func get_look():
	var lookDirection = get_global_mouse_position()
	var charPosition = global_position
	
	var triangleXY = [lookDirection.x-charPosition.x, charPosition.y-lookDirection.y]
	
	var lookVector = Vector2(lookDirection.x-charPosition.x, charPosition.y-lookDirection.y)
	var lookVAngleR =  lookVector.angle() + PI
	#var lookVAngleR =  atan2(triangleXY[0], triangleXY[1]) + PI
	
	var angle = ((180/PI)*lookVAngleR)+0
	var snap = angle%45
	print(snap)
	look_at(lookDirection)

func _physics_process(delta):
	get_movment()
	get_look()
	move_and_slide()
