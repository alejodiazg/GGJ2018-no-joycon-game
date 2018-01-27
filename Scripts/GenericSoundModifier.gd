extends Node2D

export var audio_bus_name = "Master"
export(String,'x','y','xy') var axis
export var inputLow = 0
export var inputHigh = 1000
export var outputLow = 0.5
export var outputHigh = 4
var player
var label



func _ready():
	player = get_node("../../../../Player")
#	label = get_node("Label")
	set_process(true)

func _process(delta):
	var distance = 0
	var position = get_global_position()
	var player_pos = player.get_global_position()
	if axis == 'x':
		distance = (position - player_pos).x
	elif axis == 'y':
		distance = (position - player_pos).y
	elif axis == 'xy':
		distance = position.distance_to(player_pos)
	set_effect(distance)

#esta debe ser modificada por cada efecto
func set_effect(distance):
	pass

# Esta debe ser sobrescrita por cada efecto
func disable():
	set_process(false)
	print("Disable : ", audio_bus_name)
	set_effect(inputLow)

func enable():
	set_process(true)

func distribution(input, inLow, inHigh, outLow, outHigh):
	if (input > inHigh):
		input = inHigh
	return ((input - inLow) / (inHigh - inLow)) * (outHigh - outLow) + outLow