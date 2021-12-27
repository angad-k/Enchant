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
onready var state_machine = $AnimationTree["parameters/playback"]
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
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
		if Input.is_action_pressed("ui_left") && onground:
			velocity.y = -JUMP_VALUE
			state_machine.start("run_to_jump")

		move_and_slide(velocity, Vector2(0, -1))

func _process(delta):
	if Input.is_action_pressed("ui_select"):
		GameState.start_game()
		state_machine.start("run")
	stumble_cooldown -= delta
	if(stumble_cooldown < 0):
		stumble_cooldown = 0
	if(ongroundchanged):
		if(!onground):
			state_machine.travel("run")
		ongroundchanged = false

func hit(obstacle_val):
	if(obstacle_val == Const.OBSTACLES.LOGS):
		if(stumble_cooldown != 0):
			trigger_death(obstacle_val)
		else:
			stumble_cooldown = 10
	if(obstacle_val == Const.OBSTACLES.THORNS || obstacle_val == Const.OBSTACLES.STUMP):
		trigger_death(obstacle_val)
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func trigger_death(obstacle_val):
	GameState.state = GameState.DEAD
	$Particles2D.emitting = true
	$AnimatedSprite.visible = false
	

func _on_player_detection_range_body_entered(body):
	if(body.has_method("trigger_generation")):
		body.trigger_generation()
	pass # Replace with function body.


func _on_player_detection_range_body_exited(body):
	if(body.has_method("trigger_deletion")):
		body.trigger_deletion()
	pass # Replace with function body.
