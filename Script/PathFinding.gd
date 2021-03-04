extends Node2D
var G # movement cost
var H # estimated cost
var F 
var x
var y 
var parent_x
var parent_y
var dest_x
var dest_y

func is_in_destination(get_x,  get_y, get_dest_x, get_dest_y):
	if (get_x <= get_dest_x +65 and get_x >= get_dest_x -65) and (get_y <= get_dest_y +65 and get_y >= get_dest_y -65):
		return true 
	else: 
		return false
	pass

#func calculate_H (var x,var y, var destination):
#
#	pass 

