extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	var first_child = get_child(0)
	if first_child == null :
		return
	first_child.unmute()

func launch_end_level():
	print("Level ended finally!!!!!")
	get_parent().next_lvl_timer()
