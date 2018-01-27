extends Node2D

export var speed = 1
var ripples
func _ready():
	set_process(true)
	ripples = get_node("Ripples")

func _process(delta):
	var moving = false
	if Input.is_action_pressed('ui_left'):
		self.position.x -= speed
		moving = true
	if Input.is_action_pressed('ui_right'):
		self.position.x += speed
		moving = true
	if Input.is_action_pressed('ui_up'):
		self.position.y -= speed
		moving = true
	if Input.is_action_pressed('ui_down'):
		self.position.y += speed
		moving = true
	ripples.emitting = moving
