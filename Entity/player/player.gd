extends CharacterBody2D

@export var move_player:MovePlayer
@export var health:Health
@export var gun:Node

func _ready() -> void:
	Events.farmer_attempt_rabbit.connect(damange_rabbit)
	health.is_dead.connect(_kill_rabbit)
		
	Events.rabbit_moving.emit(self)

func _physics_process(delta: float) -> void:
	get_direction()
	if !MovePlayer.is_direction_null(self):
		MovePlayer.move(self, delta)
		Events.rabbit_moving.emit(self)

func get_direction() -> void:
	MovePlayer.set_direction(self, Vector2(
		Input.get_action_strength("move_east") - Input.get_action_strength("move_west"),
		Input.get_action_strength("move_south") - Input.get_action_strength("move_north")
	).normalized())
	if !MovePlayer.is_direction_null(self):
		return#$AnimatedSprite2D.play("hop")
	else:
		return#$AnimatedSprite2D.play("sploot")

static func damange_rabbit(source:Node, rabbit:Node) -> void:
	Health.damage(rabbit, source.farmer_attack.get_damage(source))
	Events.rabbit_get_damage_from_farmer.emit(rabbit, source)
	
func _kill_rabbit(is_dead) -> void:
	if !is_dead:return
	queue_free()
