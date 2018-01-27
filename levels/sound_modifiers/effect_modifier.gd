extends "res://Scripts/GenericSoundModifier.gd"

export var bus_effect_index = 0

func set_effect(distance):
	var bus_effect = AudioServer.get_bus_effect(AudioServer.get_bus_index(audio_bus_name), bus_effect_index)
	bus_effect.rate_hz = distribution(abs(distance), inputLow, inputHigh, outputLow, outputHigh)
#	if label:
#		label.set_text(str(bus_effect.rate_hz))