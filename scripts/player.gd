extends CharacterBody2D


const SPEED = 300.0


var current_weapon = 0
var weapons = ["fireball"]
var target = position


func _physics_process(delta: float) -> void:
	velocity = position.direction_to(target) * (-1*SPEED)
	if position.distance_to(target) > 10:
		move_and_slide()
	
	
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT :
			# move away from cursor
			target = get_global_mouse_position()
			# fire current weapon
			weapons[current_weapon].shoot(target)
		if event.button_index == MOUSE_BUTTON_RIGHT :
			# interact
			pass
		if event.button_index == MOUSE_BUTTON_MIDDLE :
			pass
		if event.button_index == MOUSE_BUTTON_WHEEL_UP :
			# switch weapon --
			pass
		if event.button_index == MOUSE_BUTTON_WHEEL_DOWN :
			# switch weapon ++
			pass
	
	
	#if not is_on_floor():
		#velocity += get_gravity() * delta
#
	## Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
#
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	#var direction := Input.get_axis("left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)

	#move_and_slide()
