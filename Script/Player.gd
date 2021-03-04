extends KinematicBody2D

var speed = 700
var rotation_speed = 2.5

var velocity = Vector2()
var rotation_dir = 0


func _physics_process(delta):

	rotation += rotation_dir * rotation_speed * delta
	velocity = move_and_slide(velocity)
	rotation_dir = 0
	velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		rotation_dir += 1
	if Input.is_action_pressed("ui_left"):
		rotation_dir -= 1
	if Input.is_action_pressed("ui_down"):
		velocity -= transform.x * speed
	if Input.is_action_pressed("ui_up"):
		velocity += transform.x * speed

func _ready():
	pass



func _process(delta):
	pass
