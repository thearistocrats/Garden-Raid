extends Node2D

@export var farmer:Node
@export var rabbit:Node

func _physics_process(delta: float) -> void:
	farmer.set_target(rabbit.global_position)
