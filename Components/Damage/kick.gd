class_name Kick extends Node

@export var _stats:Dictionary = {
	"damage":0.0
}
@export var _properties:Dictionary = {}

@onready var default_stats = _stats
@onready var default_properties = _properties

static func get_damage(body:Node) -> float:
	return body.kick._stats.damage
