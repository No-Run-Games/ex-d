extends AnimatableBody2D 

var weapon_name: String
var weapon_damage: int
var weapon_speed: float
var target: Vector2
var weapon_shape: Shape2D
var s_pos: Vector2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$".".name = weapon_name + "_shot"
	$ProjectileSprite.animation = weapon_name
	$Area2D/ProjectileHitBox.shape = weapon_shape
	position = s_pos


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	#velocity = position.direction_to(target) * weapon_speed
	# TODO
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
