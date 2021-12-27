extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var stump = preload("res://utility_scenes/obstacles/stump.tscn")
var thorns = preload("res://utility_scenes/obstacles/thorns.tscn")
var logs = preload("res://utility_scenes/obstacles/logs.tscn")
var tree1 = preload("res://utility_scenes/trees/tree1.tscn")
var tree2 = preload("res://utility_scenes/trees/tree2.tscn")
var tree3 = preload("res://utility_scenes/trees/tree3.tscn")
var tree4 = preload("res://utility_scenes/trees/tree4.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	for sp in $obstacle_spawn_points.get_children():
		if(randi()%2==0):
			var randval = randf()
			if(randval < 0.3333):
				var s = stump.instance()
				s.position = sp.position
				$obstacle_spawn_points.add_child(s)
			elif(randval < 0.666):
				var s = thorns.instance()
				s.position = sp.position
				$obstacle_spawn_points.add_child(s)
			else:
				var s = logs.instance()
				s.position = sp.position
				$obstacle_spawn_points.add_child(s)
				
	for node in $tree_spawn_points.get_childen():
		if(randf() < 0.6):
			var randval = randf()
			if(randval < 0.25):
				var s = tree1.instance()
				s.position = node.position
				$tree_spawn_points.add_child(s)
			elif(randval < 0.5):
				var s = tree2.instance()
				s.position = node.position
				$tree_spawn_points.add_child(s)
			elif(randval < 0.75):
				var s = tree3.instance()
				s.position = node.position
				$tree_spawn_points.add_child(s)
			else:
				var s = tree4.instance()
				s.position = node.position
				$tree_spawn_points.add_child(s)
				
			
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
