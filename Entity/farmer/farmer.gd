extends RigidBody2D

@export var move_to_target:MoveToTarget
@export var health:Health
@export var farmer_attack:FarmerAttack

func _ready() -> void:
	health.is_dead.connect(if_is_dead)
	
	Events.gun_fired.connect(_on_gun_fired)
	Events.rabbit_get_damage_from_farmer.connect(_on_successfulhit)
	Events.rabbit_moving.connect(_move_to_rabbit)

func _physics_process(delta: float) -> void:
	MoveToTarget.move(self, delta)

func _move_to_rabbit(rabbit:Node) -> void:
	MoveToTarget.set_target(self, rabbit.global_position)

func _on_body_entered(body: Node) -> void:
	Events.farmer_attempt_rabbit.emit(self, body)

func _on_successfulhit(rabbit:Node, source:Node) -> void:
	print("hit rabbit")

func if_is_dead(is_dead:bool) -> void:
	if if_is_dead: queue_free()

static func _on_gun_fired(source:Node, target:Node) -> void:
	Health.damage(target, source.bullet_damage.damage)
	Events.on_gun_hit.emit(target, source)
