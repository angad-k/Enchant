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

var high_score = 0
var score = 0

func save():
	var save_dict = {
		"high_score" : high_score
	}
	return save_dict

### Loading Save game
func load_game():
	var save_game = File.new()
	if save_game.file_exists("user://savegame.save"):
		save_game.open("user://savegame.save", File.READ)
		var node_data = parse_json(save_game.get_line())
		high_score = node_data["high_score"]
		save_game.close()

### Saving Game
func save_game():
	var save_data = File.new()
	save_data.open("user://savegame.save", File.WRITE)
	var node_data = save()
	save_data.store_line(to_json(node_data))
	save_data.close()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func start_game():
	GameState.state = GameState.STARTED

func _process(delta):
	if(GameState.state == GameState.STARTED):
		score += delta
	if(GameState.state == DEAD):
		if(Input.is_action_pressed("ui_select")):
			restart()

func restart():
	score = 0
	get_tree().change_scene("res://utility_scenes/main_scene.tscn")
	GameState.state = MAIN_MENU

func die():
	if(score > high_score):
		high_score = score
		save_game()
	get_tree().change_scene("res://ui_scenes/game_over.tscn")
