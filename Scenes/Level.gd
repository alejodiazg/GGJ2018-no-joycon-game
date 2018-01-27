extends Node

var static_id
var base_id
var add1_id
var add2_id
var add3_id

func _ready():
	for i in range(AudioServer.get_bus_count()-1):
		AudioServer.set_bus_mute(i+1, true)
	static_id = AudioServer.get_bus_index('Static')
	base_id = AudioServer.get_bus_index('Base')
	AudioServer.set_bus_mute(static_id,false)
	AudioServer.set_bus_mute(base_id,false)

func _process(delta):