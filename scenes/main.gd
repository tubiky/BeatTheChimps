extends Node2D

@onready var cardManager = $CardManager
@onready var audioStreamPlayer = $AudioStreamPlayer

var cards


func _ready():
	GameManager.connect("correct", on_correct_signal_emitted)
	GameManager.connect("incorrect", on_incorrect_signal_emitted)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("test"):
		hide_cards()
		
	elif Input.is_action_just_pressed("restart") and GameManager.idx == 10:
		GameManager.idx = 0
		GameManager.card_position.clear()
		GameManager.set_pos()
		for i in range(5):
			GameManager.card_position.shuffle()
		cardManager.remove_cards()
		cardManager.instantiate_cards()


func hide_cards():
	var tree = get_node("/root/Main/CardContainer")
	cards = tree.get_children()
	for card in cards:
		card.disabled = false
		card.texture_normal = GameManager.cardBack


func on_correct_signal_emitted():
	audioStreamPlayer.stream = GameManager.correct_soundEffect
	audioStreamPlayer.play()


func on_incorrect_signal_emitted():
	audioStreamPlayer.stream = GameManager.incorrect_soundEffect
	audioStreamPlayer.play()
