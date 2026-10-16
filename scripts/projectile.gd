extends Area2D

var weapon_name: String
var weapon_damage: int
var weapon_speed: float
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
	$ProjectileSprite.play("fireball")
	position = s_pos


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var velocity = s_pos.direction_to(target) * weapon_speed
	position += velocity



func _on_body_entered(body: Node2D) -> void:
	if is_instance_valid(body) and body.get_meta("enemy", false) == true:
		body.queue_free() # eventually want to handle this distinctly based on body type
						  # ex: if is enemy, play death animation. if is bullet, delete both
						  #TODO: implement above and use damage to hurt enemies, add enemy healthbar
		self.queue_free()
	elif body.name == "Layer1":
		$ProjectileSprite.play("smoke")
		await get_tree().create_timer(0.5).timeout
		self.queue_free()
	pass
