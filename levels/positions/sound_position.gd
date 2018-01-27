extends Node2D

export var duration = 2.0
export var audio_bus_name = "Master"
var timer
var completed = false
var enabled = false

func _ready():
	timer = get_node("Timer")
	print("My pos in partent positions ", self.get_name(), " " , get_position_in_parent())
	

func _process(delta):
	pass

func _on_Area2D_area_entered( area ):
	if not enabled:
		return
	if not completed:
		timer.start()
		for sound in get_node("Sounds").get_children():
			sound.disable()
		print("entered")
#	pass # replace with function body


func _on_Area2D_area_exited( area ):
	if not enabled:
		return
	if not completed:
		timer.stop()
		timer.set_wait_time(duration)
		for sound in get_node("Sounds").get_children():
			sound.enable()
		print("exited")
#	pass # replace with function body


func _on_Timer_timeout():
	print("should disable sound modifier nodes")
	completed = true
	for sound in get_node("Sounds").get_children():
		sound.disable()
	var next = get_position_in_parent() + 1
	var sibling = get_parent().get_child(next)
	print("next is ", next)
	if sibling == null :
		get_parent().launch_end_level()
	else :
		get_parent().get_child(next).unmute()

func unmute():
	print('Enabled: ' + str(self.get_name()))
	enabled = true
	AudioServer.set_bus_mute(AudioServer.get_bus_index(audio_bus_name) ,false)