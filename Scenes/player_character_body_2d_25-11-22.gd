extends CharacterBody2D

const baseSpeed = 500.0
const sprintSpeedMult = 2
const spriteAmount = 4

func get_movment():
	var currentSpeed = baseSpeed
	var input_direction = Input.get_vector("left", "right", "up", "down")
	if Input.is_action_pressed("sprint"):
		currentSpeed = baseSpeed * sprintSpeedMult
	velocity = input_direction * currentSpeed

func get_look_sprite():
	const spriteAngle = 360/spriteAmount
	const spriteOffsetAngle = spriteAngle/2
	var lookDirection = get_global_mouse_position()
	var playerPosition = global_position
	
	
	var triangleXY = [lookDirection.x-playerPosition.x, playerPosition.y-lookDirection.y]
	
	var lookVector = Vector2(lookDirection.x-playerPosition.x, playerPosition.y-lookDirection.y)
	var lookVAngleR =  wrapf(lookVector.angle() + 2*PI, 0, 2*PI)
	#var lookVAngleR =  atan2(triangleXY[0], triangleXY[1]) + PI
	
	var angle = ((180/PI)*lookVAngleR)+0
	var quadrant: int = (angle+spriteOffsetAngle)/spriteAngle
	quadrant = wrapi(quadrant, 0, spriteAmount)
	
	
	
	$"Sprite2D-front".hide()
	$"Sprite2D-back".hide()
	$"Sprite2D-right".hide()
	$"Sprite2D-left".hide()
	print(quadrant)
	if quadrant == 0:
		$"Sprite2D-right".show()
	if quadrant == 1:
		$"Sprite2D-back".show()
	if quadrant == 2:
		$"Sprite2D-left".show()
	if quadrant == 3:
		$"Sprite2D-front".show()
	
	#look_at(lookDirection)

func _physics_process(delta):
	get_movment()
	get_look_sprite()
	move_and_slide()
