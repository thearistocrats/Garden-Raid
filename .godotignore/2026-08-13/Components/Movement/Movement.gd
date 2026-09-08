class_name MovementComponent extends Node

@warning_ignore("unused_private_class_variable")
@export var _stats:Dictionary = {
	"speed":0.0,
	"direction":Vector2.ZERO
	#"rotation":0.0
}

@export var _properties:Dictionary = {
	"target":Vector2.ZERO
}

@onready var default_stats = _stats
@onready var default_properties = _properties

@warning_ignore("unused_signal")
signal on_collision(body, collider)

static func move(body:CharacterBody2D, _delta:float) -> void:
	var stats = body.movement._stats
	body.velocity = stats.speed * stats.direction
	#if stats.direction != Vector2.ZERO:
	if stats.direction != Vector2.ZERO:
		var direction_angle = (stats.direction.angle() * 180) / PI + 90
		body.set_global_rotation_degrees(direction_angle)
	body.move_and_slide()
	for i in body.get_slide_collision_count():
		var collision = body.get_slide_collision(i)
		body.movement.on_collision.emit(body, collision.get_collider())

static func move_to_target(body:CharacterBody2D, _delta:float) -> void:
	var stats = body.movement._stats
	var properties = body.movement._properties
	var dir_to_target = (properties.target - body.global_position).normalized()
	body.velocity = stats.speed * dir_to_target
	#if stats.direction != Vector2.ZERO:
	if stats.direction != Vector2.ZERO:
		var direction_angle = (stats.direction.angle() * 180) / PI + 90
		body.set_global_rotation_degrees(direction_angle)
	body.move_and_slide()
	for i in body.get_slide_collision_count():
		var collision = body.get_slide_collision(i)
		body.movement.on_collision.emit(body, collision.get_collider())

static func bounce_back(body:CharacterBody2D, _delta:float) -> void:
	pass
