extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _process(delta):
	if(GameState.state == GameState.MAIN_MENU):
		$Label.text = "HIGH SCORE : " + str(int(GameState.high_score))
	if(GameState.state == GameState.STARTED):
		$Label2.text = "SCORE : " + str(int(GameState.score))
		$Label.modulate.a = lerp($Label.modulate.a, 0, 0.05)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
