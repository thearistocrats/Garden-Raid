class_name Kick extends Node

@export var _stats:Dictionary = {
	"damage":0.0
}
@export var _properties:Dictionary = {}

@onready var default_stats = _stats
@onready var default_properties = _properties

static func kick(body:Node, target:Node) -> void:
	#target.health.take_damage(from, body)
	pass
