extends KinematicBody2D
## jos edessä auto väistää aina ulkoreunan puolelta

var speed = 300 *2
var rotation_speed = 2.5

var velocity = Vector2.ZERO
var rotation_dir = 0
var lapCount = 0
var wrongway = false

func _physics_process(delta):
	_movement()
	velocity += transform.x * speed
	rotation += rotation_dir * rotation_speed * delta
	velocity = move_and_slide(velocity)
	if lapCount == 3:
		get_parent().get_node("Enviroment/Track1/Ulkoseina/CollisionPolygon2D").disabled = true
		get_parent().get_node("Enviroment/curve/ulkoseina/ulkoseinacol").disabled = false ##loppumutka
		get_parent().get_node("Enviroment/curve/circle/circleCol").disabled = false ##loppumutkan sisäympyrä
		pass
	pass

func _movement():
	rotation_dir = 0
	velocity = Vector2.ZERO
	if $Detection/fLeft.is_colliding() and $Detection/Long/LongRight.is_colliding():# and speed > 0:
		rotation_dir += 1.5
		if $Detection/mLeft.is_colliding() and speed > 50:
			speed -= 10
			pass
		pass
	if !$Detection/Long/LongRight.is_colliding():
		rotation_dir += 1.0
##kääntyy vasenmalle
	if $Detection/fRight.is_colliding()and $Detection/Long/LongLeft	.is_colliding()  :# and speed > 0:
		rotation_dir -= 1.5
		if $Detection/mRight.is_colliding() and speed > 50:
			speed -= 10
			pass
		pass
	if !$Detection/Long/LongLeft.is_colliding():
		rotation_dir -= 1.0
##kiihdyttää auton ilman seinässä olemista
	if (!$Detection/fLeft.is_colliding()  and !$Detection/fRight.is_colliding()):
		if speed <600:
			speed += 10
			pass
		pass
		##jos kaikki törmää peruuttaa ja pääsee etsimään uutta reittiä
	if $Detection/fLeft.is_colliding() and $Detection/mLeft.is_colliding() and $Detection/Middle.is_colliding() and $Detection/mRight.is_colliding() and $Detection/fRight.is_colliding():
		speed -= 10
		if speed > -50 and speed <30 and ($Detection/Middle.get_collider().get_name() == "waypointbody" or $Detection/Middle.get_collider().get_name() == "waypointbody2" )  :
#			yield(get_tree().create_timer(2),"timeout")
#			print($Detection/Middle.get_collider().get_name())
			wrongway = true
			if wrongway:
				rotate(deg2rad(180))
				wrongway = false
		pass
	pass
func _on_Area2D_area_entered(area):
	if area.get_name() == "StartFinish": 
		lapCount +=  1
	pass # Replace with function body.
func _on_Area2D_body_entered(body):
	pass # Replace with function body.
