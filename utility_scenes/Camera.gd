extends Camera2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const DEFAULT_HEIGHT = 600
const DEFAULT_WIDTH = 1024
var zoom_x
var zoom_y 
onready var player = get_parent().get_node("Player")
# Called when the node enters the scene tree for the first time.
func _ready():
	zoom_x = zoom.x
	zoom_y = zoom.y
	pass # Replace with function body.

func _physics_process(delta):
	var actual_width = get_viewport().size.x
	var actual_height = get_viewport().size.y
	var multiplier = 1	
	if(GameState.state == GameState.STARTED):
		if max(actual_height/DEFAULT_HEIGHT, actual_width/DEFAULT_WIDTH)-1 >= 0 :
			multiplier = lerp(1.0, 2.0, actual_height/DEFAULT_HEIGHT - 1)
		else:
			multiplier = lerp(1.0, 1.5, actual_height/DEFAULT_HEIGHT - 1)
			multiplier = 1 / multiplier
		position.x = lerp(position.x, player.position.x, 0.085)
		position.y = lerp(position.y, -663, 0.0085)
		zoom.x = lerp(zoom.x, 0.85 / multiplier, 0.0085)
		zoom.y = lerp(zoom.y, 0.85 / multiplier, 0.0085)
	else :
		if max(actual_height/DEFAULT_HEIGHT, actual_width/DEFAULT_WIDTH)-1 >= 0 :
			multiplier = lerp(1.0, 2.0, actual_height/DEFAULT_HEIGHT - 1)
		else:
			multiplier = lerp(1.0, 1.5, actual_height/DEFAULT_HEIGHT - 1)
			multiplier = 1 / multiplier
		zoom.x = zoom_x / multiplier
		zoom.y = zoom_y / multiplier
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

