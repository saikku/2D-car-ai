extends KinematicBody2D
var startPosition = Vector2()

var speed = Vector2()
var numberOfTicks = 0
var startDirection = rand_range(-.1,.1)

func wave_motion(delta):
	if startDirection == 0:
		startDirection = rand_range(-.1,.1)
	numberOfTicks += delta
	speed.y = ((startDirection * 40 ) * sin( numberOfTicks * 0.5 * PI ))+ position.y
	position.y = speed.y
	pass
func _physics_process(delta):
	wave_motion(delta)
	pass
