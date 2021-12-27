extends Camera2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var player = get_parent().get_node("Player")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if(GameState.state == GameState.STARTED):
		position.x = lerp(position.x, player.position.x, 0.085)
		position.y = lerp(position.y, -663, 0.0085)
		zoom.x = lerp(zoom.x, 0.85, 0.0085)
		zoom.y = lerp(zoom.y, 0.85, 0.0085)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
