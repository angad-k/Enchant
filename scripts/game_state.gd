extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
enum {
	MAIN_MENU,
	STARTED,
	DEAD
}
var state = MAIN_MENU

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func start_game():
	GameState.state = GameState.STARTED

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
