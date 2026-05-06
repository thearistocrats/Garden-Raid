class_name MovementComponent extends Node

@warning_ignore("unused_private_class_variable")
@export var _stats:Dictionary = {
	"speed":0.0,
	"direction":Vector2.ZERO
}

static func move_rabbit(body:CharacterBody2D, _delta:float) -> void:
	var stats = body.movement._stats
	body.velocity = stats.speed * stats.direction
	body.move_and_collide(body.velocity)
