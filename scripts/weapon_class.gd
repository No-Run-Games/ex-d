# Who doesn't love a good class?
## A weapon skeleton to compress variable clog in the player class. Possible additions: bounces...
## weapon_name, weapon_damage, weapon_speed, move_speed, target
class_name WeaponClass
extends Node2D

#@onready var projectile = load("res://scripts/projectile.gd")

# Defining Variables
var weapon_name: String = ""
var weapon_damage: int = 0
var weapon_speed: float = 0
var move_speed: float = 0
var target: Vector2 = Vector2(0,0)

# Runs on the .new() method
func _init(w_name, w_damage, w_speed, m_speed):
	weapon_name = w_name
	weapon_damage = w_damage
	weapon_speed = w_speed
	move_speed = m_speed
	#target = tar
