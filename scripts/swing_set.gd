extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _ready():
	var arr = []
	for sp in $swings.get_children():
		if(randi()%2==0 || len(arr)==0 || !arr[len(arr)-1]):
			arr.append(true)
		else:
			arr.append(false)
	var count = 0
	for swing in $swings.get_children():
		if(arr[count]):
			swing.position.y = swing.position.y + randf()*300 - 150
		else:
			swing.queue_free()
		count +=1
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
