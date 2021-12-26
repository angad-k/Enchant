extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var obstacle_name = get_parent().obstacle_val

func _ready():
	pass # Replace with function body.
	
func _on_Area2D_body_entered(body):
	if body.has_method("hit") :
			body.hit(obstacle_name)
	pass # Replace with function body.
