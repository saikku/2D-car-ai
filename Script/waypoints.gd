extends Node2D


func _physics_process(delta):
#	print("waypoint1: ",$Waypoint1/waypointbody/bodycol.disabled  )
#	print("waypoint2: ",$Waypoint2/waypointbody2/bodycol2.disabled  )


	pass


func _on_Waypoint1_body_exited(body):
	if body.get_name() == "Enemy":
#		yield(get_tree().create_timer(0.2),"timeout")
		$Waypoint1/waypointbody/bodycol.set_deferred("disabled",false)
		$Waypoint2/waypointbody2/bodycol2.set_deferred("disabled",true)
	pass # Replace with function body.


func _on_Waypoint2_body_exited(body):
	if body.get_name() == "Enemy":
		$Waypoint1/waypointbody/bodycol.set_deferred("disabled",true)
		$Waypoint2/waypointbody2/bodycol2.set_deferred("disabled",false)
	pass # Replace with function body.
