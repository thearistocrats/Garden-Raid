class_name FarmerAttack extends Node

@export var _stats:Dictionary = {
	"damage":0.0
}
@export var _properties:Dictionary = {
	"target":null
}

@onready var default_stats = _stats
@onready var default_properties = _properties

static func get_damage(source:Node) -> float:
	return source.farmer_attack._stats.damage
