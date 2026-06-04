extends CharacterBody2D

@export var movement:MovementComponent
@export var health:HealthComponent

var is_moving

func _ready() -> void:
	$AnimatedSprite2D.play("sploot")

func _physics_process(delta: float) -> void:
	get_direction()
	MovementComponent.move_rabbit(self, delta)

func get_direction() -> void:
	movement._stats.direction = Vector2(
		Input.get_action_strength("move_east") - Input.get_action_strength("move_west"),
		Input.get_action_strength("move_south") - Input.get_action_strength("move_north")
	).normalized()
	if movement._stats.direction != Vector2.ZERO:
		$AnimatedSprite2D.play("hop")
	else:
		$AnimatedSprite2D.play("sploot")
