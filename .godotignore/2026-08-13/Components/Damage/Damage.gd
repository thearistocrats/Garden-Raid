class_name DamageComponent extends Node

@export var _stats:Dictionary = {
	"amount":0.0
}
@export var _properties:Dictionary = {}

@onready var default_stats = _stats
@onready var default_properties = _properties

static func kick(player:Node, target:Node) -> void:
	var component = player.component
	var stats = component._stats
	var properties = component._properties
	'''
	get istargetinrange
	if true:
		healthcomponent.dmaage
'''
