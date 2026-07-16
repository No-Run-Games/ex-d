extends Node
# This is our global script. Anything defined here you can access from any node
# You set this up by going to Project Settings -> Globals -> Select Script/Screen
# You access it with Global.method
# You're also able to use the current scene variable to abstract some things I
# didn't below. Also of note, scene change apparently gets weird with this.
# Check out this for more info: https://docs.godotengine.org/en/3.0/getting_started/step_by_step/singletons_autoload.html

var current_scene:Node2D = null
var player_health = 100

func _ready():
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() -1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
