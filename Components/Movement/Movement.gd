class_name MovementComponent extends Node

@warning_ignore("unused_private_class_variable")
@export var _stats:Dictionary = {
	"speed":0.0,
	"direction":Vector2.ZERO
	#"rotation":0.0
}

static func move_rabbit(body:CharacterBody2D, _delta:float) -> void:
	var stats = body.movement._stats
	body.velocity = stats.speed * stats.direction
	#if stats.direction != Vector2.ZERO:
	if stats.direction != Vector2.ZERO:
		var direction_angle = (stats.direction.angle() * 180) / PI + 90
		body.set_global_rotation_degrees(direction_angle)
	body.move_and_slide()
	#print(stats.direction)
