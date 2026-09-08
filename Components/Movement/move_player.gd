class_name MovePlayer extends Node

@export var _stats:Dictionary = {
	"speed":0.0,
	"direction":Vector2.ZERO
}

@export var _properties:Dictionary = {
	"facing":Vector2.ZERO
}

@onready var default_stats = _stats
@onready var default_properties = _properties

@warning_ignore("unused_signal")
signal on_collision(body, collider)

static func set_direction(player:CharacterBody2D, direction:Vector2) -> void:
	player.move_player._stats.direction = direction

static func is_direction_null(player:CharacterBody2D) -> bool:
	return !player.move_player._stats.direction != Vector2.ZERO

static func move(player:CharacterBody2D, _delta) -> void:
	var move_player = player.move_player
	var stats = move_player._stats
	var properties = move_player._properties
	
	if stats.direction != Vector2.ZERO:
		var direction_angle = (stats.direction.angle() * 180) / PI + 90
		player.set_global_rotation_degrees(direction_angle)
		properties.facing = direction_angle
	
	player.velocity = stats.speed * stats.direction
	player.move_and_slide()
	for i in player.get_slide_collision_count():
		var collision = player.get_slide_collision(i)
		player.move_player.on_collision.emit(player, collision.get_collider())
