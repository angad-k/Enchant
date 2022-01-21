extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const DEFAULT_HEIGHT = 600
const DEFAULT_WIDTH = 1024
var zoom_x
var zoom_y 
onready var camera = $Camera2D
# Called when the node enters the scene tree for the first time.
func _ready():
	if(OS.has_touchscreen_ui_hint()):
		$Sprite2.visible = true
	$Label.text = str(int(GameState.score))
	$Label2.text = str(int(GameState.high_score))
	zoom_x = camera.zoom.x
	zoom_y = camera.zoom.y
	pass # Replace with function body.

func _process(delta):
	var actual_width = get_viewport().size.x
	var actual_height = get_viewport().size.y
	var multiplier = 1
	if max(actual_height/DEFAULT_HEIGHT, actual_width/DEFAULT_WIDTH)-1 >= 0 :
		multiplier = lerp(1.0, 1.8, actual_height/DEFAULT_HEIGHT - 1)
	else:
		multiplier = lerp(1.0, 1.5, actual_height/DEFAULT_HEIGHT - 1)
		multiplier = 1 / multiplier
	camera.zoom.x = zoom_x / multiplier
	camera.zoom.y = zoom_y / multiplier

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TouchScreenButton_pressed():
	GameState.restart()
	pass # Replace with function body.
