extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var stump = preload("res://utility_scenes/obstacles/stump.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	for sp in $obstacle_spawn_points.get_children():
		if(randi()%2==0):
			var s = stump.instance()
			s.position = sp.position
			$obstacle_spawn_points.add_child(s)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
