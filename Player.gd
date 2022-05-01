extends KinematicBody2D

const UP = Vector2(0,-1)
const GRAVITY = 60
const FALLSPEED = 500
const SPEED = 200
const JUMPFORCE = 900

var motion = Vector2()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _physics_process(delta):
	
	if motion.y < FALLSPEED:
		motion.y += GRAVITY
	
	if Input.is_action_pressed("right"):
		motion.x = SPEED
	elif Input.is_action_pressed("left"):
		motion.x = -SPEED
	else:
		motion.x = 0
		
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			motion.y = -JUMPFORCE

	motion = move_and_slide(motion, UP)
