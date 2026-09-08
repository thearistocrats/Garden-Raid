extends CharacterBody2D

@export var health:HealthComponent
@export var movement:MovementComponent
@export var damage:DamageComponent

func _ready() -> void:
	movement.on_collision.connect(_on_collision)

func set_target(target:Vector2) -> void:
	movement._properties.target = target

func _physics_process(delta: float) -> void:
	MovementComponent.move_to_target(self, delta)

func _on_collision(body:Node, collider:Node) -> void:
	collider.health.damage(collider, body.damage._stats.amount)
	print(body, collider)
