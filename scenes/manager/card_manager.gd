extends Node


var cardContainer


func _ready():
	cardContainer = get_tree().get_first_node_in_group("container")
	GameManager.card_position.shuffle()
	instantiate_cards()	


func instantiate_cards():
	for i in range(1, 11):
		var card = Card.new(i)
		card.disabled = true
		card.position = GameManager.card_position.pop_front()
		cardContainer.add_child(card)


func remove_cards():
	var tree = get_node("/root/Main/CardContainer")
	var cards = tree.get_children()
	for card in cards:
		card.queue_free()
