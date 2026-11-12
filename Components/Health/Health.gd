class_name Health extends Node

@export var _stats: Dictionary = {
	"max_health": 0.0,
	"min_health": 0.0
}

var _properties:Dictionary = {
	"current_health": 0.0,
	"previous_health": 0.0,
	"death_state":false
}

@onready var default_stats = _stats
@onready var default_properties = _properties

@warning_ignore_start("unused_signal")
signal is_dead(bool)
signal health_changed(delta:float)
@warning_ignore_restore("unused_signal")

func _ready() -> void:
	reset_health(self.get_parent())

static func reset_health(body:Node) -> void:
	var health = body.health
	var stats = health._stats
	var properties = health._properties
	
	properties.previous_health = properties.current_health
	properties.current_health = stats.max_health
	
	if HealthModules.get_change_in_death_state(health):
		print()
		health.is_dead.emit(health._properties.death_state)
	health.health_changed.emit(HealthModules.get_change_in_health(health))

static func damage(body:Node, amount:float) -> void:
	var health = body.health
	#var stats = health._stats
	var properties = health._properties
	
	properties.previous_health = properties.current_health
	properties.current_health -= amount
	HealthModules.clamp_health(health)
	
	if HealthModules.get_change_in_death_state(health):
		health.is_dead.emit(properties.death_state)
	health.health_changed.emit(HealthModules.get_change_in_health(health))

static func heal(body:Node, amount) -> void:
	var health = body.health
	#var stats = health._stats
	var properties = health._properties
	
	properties.previous_health = properties.current_health
	properties.current_health += amount
	HealthModules.clamp_health(health)
	
	if HealthModules.get_change_in_death_state(health):
		health.is_dead.emit(health._properties.death_state)
	health.health_changed.emit(HealthModules.get_change_in_health(health))
