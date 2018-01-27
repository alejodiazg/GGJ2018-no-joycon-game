extends "res://Scripts/GenericSoundModifier.gd"

func set_effect(distance):
	var n = distribution(abs(distance), inputLow, inputHigh, outputLow, outputHigh)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index(audio_bus_name), n)
#	if label:
#		label.set_text(str(bus_effect.rate_hz))