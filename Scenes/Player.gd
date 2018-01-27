extends Node2D

export var speed = 1
onready var window_size = OS.get_window_size()
var ripples
func _ready():
	set_process(true)
	ripples = get_node("Ripples")

func _process(delta):
	var moving = false
	var x = 0
	var y = 0
	if Input.is_action_pressed('ui_left'):
		x -= speed
		moving = true
	if Input.is_action_pressed('ui_right'):
		x += speed
		moving = true
	if Input.is_action_pressed('ui_up'):
		y -= speed
		moving = true
	if Input.is_action_pressed('ui_down'):
		y += speed
		moving = true
	self.position.x += x
	self.position.y += y
	
	if self.position.x < 0 :
		self.position.x = 0
	if self.position.x > 1920 :
		self.position.x = 1920
	if self.position.y < 0 :
		self.position.y = 0
	if self.position.y > 1080 :
		self.position.y = 1080
	
	ripples.emitting = moving
