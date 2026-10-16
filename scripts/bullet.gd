extends Area2D

var weapon_name: String
var weapon_damage: int
var weapon_speed: float = 5.0
var target: Vector2
var weapon_shape: Shape2D
var s_pos: Vector2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#if $".".name:
		#$".".name = weapon_name + "_shot"
	#if $ProjectileSprite.animation:
		#$ProjectileSprite.animation = weapon_name
	#if $Area2D/ProjectileHitBox.shape:
		#$Area2D/ProjectileHitBox.shape = weapon_shape
	position = s_pos


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var velocity = s_pos.direction_to(target) * weapon_speed
	position += velocity
	


func _on_body_entered(body: Node2D) -> void:
	if is_instance_valid(body) and body.get_meta("player", false) == true:
		self.queue_free()
		#TODO player damage
	elif body.name == "Layer1":
		self.queue_free()
