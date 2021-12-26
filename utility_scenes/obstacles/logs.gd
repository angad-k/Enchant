extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var obstacle_val = Const.OBSTACLES.LOGS
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if body.has_method("hit") :
		body.hit(obstacle_val)
		$Particles2D.emitting = true
		$Sprite.queue_free()
	pass # Replace with function body.
