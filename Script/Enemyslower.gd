extends KinematicBody2D

var speed = 300 
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
		if speed <300:
			speed += 10
			pass
		pass
		##jos kaikki törmää peruuttaa ja pääsee etsimään uutta reittiä
	if $Detection/fLeft.is_colliding() and $Detection/mLeft.is_colliding() and $Detection/Middle.is_colliding() and $Detection/mRight.is_colliding() and $Detection/fRight.is_colliding():
		speed -= 10
		if speed > -50 and speed <30 and ($Detection/Middle.get_collider().get_name() == "waypointbody" or $Detection/Middle.get_collider().get_name() == "waypointbody2" )  :
			wrongway = true
			if wrongway:
				rotate(deg2rad(180))
				wrongway = false
		pass
	pass

func _on_End_body_entered(body):
	if body.get_name() == "EnemySlow1" :#  
		get_parent().get_node("EnemySlow1").position = Vector2(-637,164)
		get_parent().get_node("EnemySlow1").rotation_degrees = 0
	if body.get_name() == "EnemySlow2":
		get_parent().get_node("EnemySlow2").position = Vector2(-637,248)
		get_parent().get_node("EnemySlow2").rotation_degrees = 0
	if  body.get_name() == "EnemySlow3":
		get_parent().get_node("EnemySlow3").position = Vector2(-637,200)
		get_parent().get_node("EnemySlow3").rotation_degrees = 0
	if  body.get_name() == "Enemy":
		get_parent().get_parent().get_parent().get_node("Enemy").position = Vector2(529,2220)
		get_parent().get_parent().get_parent().get_node("Enemy").rotation_degrees = 0

	pass
