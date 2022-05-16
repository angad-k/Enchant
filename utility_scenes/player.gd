extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var GRAVITY = 200.0
export var WALK_SPEED = 200
export var JUMP_VALUE = 300.0
var velocity = Vector2()
var onground = true
var ongroundchanged = false
var stumble_cooldown = 0.0
var swiped_up = false
onready var state_machine = $AnimationTree["parameters/playback"]
# Called when the node enters the scene tree for the first time.

const SENSITIVITY_JUMP := -10
const SENSITIVITY_SLIDE := 15

#This wont be called if a GUI or something else is handling the event
func _unhandled_input(event):
	if event is InputEventScreenDrag:
	# The faster the swipe, the higher the relative value
		var swipe = event.relative
		if swipe.y < SENSITIVITY_JUMP : 
			swipe_handler("up")
		elif swipe.x < -SENSITIVITY_SLIDE : pass
		elif swipe.x > SENSITIVITY_SLIDE : pass

func _ready():
	#connect("swipe", self, "swipe_handler")
	pass # Replace with function body.

func swipe_handler(direction):
	print("signal mila")
	if(direction == "up"):
		swiped_up = true

func _physics_process(delta):
	if(GameState.state == GameState.STARTED):
		velocity.y += delta * GRAVITY
		velocity.x =  WALK_SPEED
		var initial = onground
		onground= $RayCast2D.is_colliding()
		if(initial != onground):
			ongroundchanged = true
		if(onground):
			velocity.y = 0
		if (Input.is_action_pressed("ui_select") || swiped_up) && onground:
			velocity.y = -JUMP_VALUE
			state_machine.start("run_to_jump")
			$jump.play()
			$run.stream_paused = true
		if(swiped_up):
				swiped_up = false

		move_and_slide(velocity, Vector2(0, -1))

func _process(delta):
	if Input.is_action_pressed("ui_select") && GameState.state == GameState.MAIN_MENU:
		GameState.start_game()
		state_machine.start("run")
		$run.play()
	stumble_cooldown -= delta
	if(stumble_cooldown < 0):
		stumble_cooldown = 0
	if(ongroundchanged):
		if(onground):
			state_machine.start("run")
			$run.stream_paused = false
		ongroundchanged = false

func hit(obstacle_val):
	if(obstacle_val == Const.OBSTACLES.LOGS):
		if(stumble_cooldown != 0):
			$hit.play()
			trigger_death(obstacle_val)
		else:
			stumble_cooldown = 10
			$hit.play()
	if(obstacle_val == Const.OBSTACLES.THORNS || obstacle_val == Const.OBSTACLES.STUMP):
		$hit.play()
		trigger_death(obstacle_val)
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func trigger_death(obstacle_val):
	GameState.state = GameState.DEAD
	$Particles2D.emitting = true
	$AnimatedSprite.visible = false
	GameState.die()

func _on_start2_pressed():
	GameState.start_game()
	state_machine.start("run")
	pass # Replace with function body.


func _on_player_detection_range_area_entered(area):
	if(area.has_method("trigger_generation")):
		area.trigger_generation()
	pass # Replace with function body.


func _on_player_detection_range_area_exited(area):
	if(area.has_method("trigger_deletion")):
		area.trigger_deletion()
	pass # Replace with function body.
