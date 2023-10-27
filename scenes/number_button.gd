extends TextureButton
class_name Card

signal correct
signal incorrect

var value
var face
var back = preload("res://image/back.png")
var timer


# Called when the node enters the scene tree for the first time.
func _ready():
	connect("pressed", _on_pressed)
	timer = Timer.new()
	add_child(timer)
	timer.wait_time = 4
	timer.connect("timeout", on_timer_timeout)
	
	
	
func _init(v):
	value = v
	face = load("res://image/" + str(v) + ".png")
	texture_normal = face


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_pressed():
	if GameManager.ORDER[GameManager.idx] == value:
		if GameManager.idx <=9:
			GameManager.idx += 1
			texture_normal = face
			GameManager.correct.emit()
			disabled = true


	else:
		GameManager.incorrect.emit()


func hide_card():
	texture_normal = back


func on_timer_timeout():
	hide_card()
