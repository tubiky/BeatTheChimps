extends CanvasLayer

@onready var label = $Label

var timer

# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.connect("correct", on_correct_signal_emitted)
	GameManager.connect("incorrect", on_incorrect_signal_emitted)
	visible = false
	timer_setting()
	timer.connect("timeout", on_timer_timeout)


func timer_setting():
	timer = Timer.new()
	timer.wait_time = 0.5
	timer.autostart = false
	add_child(timer)


func on_correct_signal_emitted():
	timer.start()
	visible = true
	label.text = "CORRECT"


func on_incorrect_signal_emitted():
	timer.start()
	visible = true
	label.text = "INCORRECT"
	

func on_timer_timeout():
	visible = false
	



