class_name MoveToTarget extends Node

@export var _stats:Dictionary = {
	"speed":0.0,
	"target":Vector2.ZERO
}

@export var _properties:Dictionary = {
	"facing":Vector2.ZERO
}

@onready var default_stats = _stats
@onready var default_properties = _properties

@warning_ignore("unused_signal")
signal on_collision(body, collider)

static func set_target(body:RigidBody2D, target:Vector2) -> void:
	body.move_to_target._stats.target = target

static func move(body:RigidBody2D, _delta) -> void:
	var stats = body.move_to_target._stats
	var properties = body.move_to_target._properties
	var dir_to_target = (stats.target - body.global_position).normalized()
	
	if dir_to_target != Vector2.ZERO:
		var direction_angle = (dir_to_target.angle() * 180) / PI + 90
		body.set_global_rotation_degrees(direction_angle)
		properties.facing = direction_angle
	
	body.linear_velocity = stats.speed * dir_to_target
	'''
	#body.move_and_slide()
	for i in body.get_slide_collision_count():
		var collision = body.get_slide_collision(i)
		body.move_to_target.on_collision.emit(body, collision.get_collider())
		'''
