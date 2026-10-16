extends CharacterBody2D


const SPEED = 300.0

@onready var spawner = get_tree().get_root().get_node("Game/ProjectileSpawner")
@onready var projectile = load("res://scenes/projectile.tscn")

var current_weapon = 0
var weapons = [WeaponClass.new(
	"fireball",
	5,
	5,
	5
)]
var target = position


func _physics_process(delta: float) -> void:
	if velocity > Vector2(0,0):
		if self.is_on_wall():
			velocity = velocity.move_toward(Vector2(0,0),2.0)
		velocity = velocity.move_toward(Vector2(0,0),1.0)
	
	if position.distance_to(target) > 10:
		move_and_slide()
	
	
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT :
			# move away from cursor
			target = get_global_mouse_position()
			velocity = position.direction_to(target) * (-1*SPEED)
			# fire current weapon
			shoot(target)
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
	
func shoot(target: Vector2) -> void:
	var instance = projectile.instantiate()
	instance.weapon_name = weapons[current_weapon].weapon_name
	instance.weapon_damage = weapons[current_weapon].weapon_damage
	instance.weapon_speed = weapons[current_weapon].weapon_speed
	instance.target = target
	instance.s_pos = position
	spawner.add_child.call_deferred(instance)
	
