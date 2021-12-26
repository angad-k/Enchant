extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var test_set1 = preload("res://set_scenes/test_set1.tscn")
var test_set2 = preload("res://set_scenes/test_set2.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func trigger_generation(position):
	var x
	if(randi()%2==0):
		x = test_set1.instance()
	else:
		x = test_set2.instance()
	x.position = position
	get_tree().root.add_child(x)
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
