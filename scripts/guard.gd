extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var can_shoot:bool = false



@onready var spawner = get_tree().get_root().get_node("Game/BulletSpawner")
@onready var projectile = load("res://scenes/bullet.tscn")

func _ready() -> void:
	$ShootCooldown.timeout.connect(set.bind("can_shoot", true))
	pass

func _physics_process(delta: float) -> void:
	move_and_slide()
	shoot()
	
func shoot():
	#TODO: player location function
	
	
	if can_shoot:
		can_shoot = false
		var instance = projectile.instantiate()
		instance.s_pos = self.position
		instance.target = get_player_expected_location()
		spawner.add_child.call_deferred(instance)
		$ShootCooldown.start()
		


func get_player_expected_location():
	# placeholder for now, TODO account for player velocity
	return Global.get_player_position()
