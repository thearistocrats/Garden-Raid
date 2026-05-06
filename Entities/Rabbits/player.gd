extends CharacterBody2D

@export var movement:MovementComponent
@export var health:HealthComponent

func _physics_process(delta: float) -> void:pass
	#print(self.movement._stats.direction)

func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		var direction = movement._stats.direction
		if event.is_action_pressed("move_north"):
			direction.y += 1
		if event.is_action_pressed("move_east"):
			direction.x += 1
		if event.is_action_pressed("move_south"):
			direction.y += 1
		if event.is_action_pressed("move_west"):
			direction.y += 1
		movement.move_rabbit(self, 0.0)
		
		print(direction)
