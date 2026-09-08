class_name FollowParent extends Node2D

@export var _stats:Dictionary = {
	"parent":null,
	"follow_speed":0.0
}
@export var _properties:Dictionary = {
	"previous_position":Vector2.ZERO,
	"facing":Vector2.ZERO
}

@onready var default_stats = _stats
@onready var default_properties = _properties

static func set_parent(body:Area2D, parent:Node) -> void:
	body.follow_parent._stats.parent = parent

static func follow(body:Area2D, delta:float) -> void:
	var follow_parent = body.follow_parent
	var stats = follow_parent._stats
	var properties = follow_parent._properties
	
	var parent_position = body.parent.global_position
	body.global_position += (body.global_position - parent_position) * stats.follow_speed * delta
	
	
	pass
