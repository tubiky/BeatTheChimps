extends Node

const SIZE = 180


signal correct
signal incorrect


const ORDER = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

var correct_soundEffect = preload("res://resources/sounds/woohoo.wav")
var incorrect_soundEffect = preload("res://resources/sounds/fail.wav")
var cardBack = preload("res://image/back.png")
var card_position = []
var idx

func _ready():
	idx = 0
	set_pos()



func set_pos():
	for row in range(0, 7):
		for col in range(0, 4):
			var pos = Vector2((row * SIZE), (col * SIZE))
			card_position.append(pos)
