extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var thread
const test_set1 = preload("res://set_scenes/forest_set.tscn")
const test_set2 = preload("res://set_scenes/swing_set.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	pass # Replace with function body.

func trigger_generation(p_position):
	thread = Thread.new()
	thread.start(self, "load_set_scene", p_position)

func load_set_scene(p_position):
	
	var x
	if(randf()<0.5):
		x = test_set1.instance()
	else:
		x = test_set2.instance()
	x.position = p_position
	get_tree().root.get_node("Node2D").add_child(x)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
