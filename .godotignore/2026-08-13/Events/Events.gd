extends Node
#gives entities connections between components

#all events (between two parties) have a sender and reciever signal
signal on_attempt_damage(source:Node, target:Node)
func attempt_damage(source:Node, target:Node) -> void:
	source.damage
#used by a node with a damage component
#used by a node
signal on_do_damage(target:Node, source:Node)
#used by a node with a health component
#used by a node
