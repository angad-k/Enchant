extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var GRAVITY = 200.0
export var WALK_SPEED = 200
export var JUMP_VALUE = 300.0
var velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _physics_process(delta):
	velocity.y += delta * GRAVITY
	velocity.x =  WALK_SPEED
	if Input.is_action_pressed("ui_left") && $RayCast2D.is_colliding():
		velocity.y = -JUMP_VALUE

	move_and_slide(velocity, Vector2(0, -1))

func hit(obstacle_name):
	print(obstacle_name)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_player_detection_range_body_entered(body):
	if(body.has_method("trigger_generation")):
		body.trigger_generation()
	pass # Replace with function body.


func _on_player_detection_range_body_exited(body):
	if(body.has_method("trigger_deletion")):
		body.trigger_deletion()
	pass # Replace with function body.
