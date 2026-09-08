class_name move_from_damage extends Node2D

@export var _stats:Dictionary = {
	"impulse":0.0,
	"direction":Vector2.ZERO
}
@export var _properties:Dictionary = {}

@onready var default_stats = _stats
@onready var default_properties = _properties

@warning_ignore("unused_signal")
signal on_collision(body, collider)

static func move(body:CollisionObject2D) -> void:
	var stats = body.move_from_damage._stats
	var properties = body.move_from_damage._properties
