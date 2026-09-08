class_name Health extends Node

@export var _stats: Dictionary = {
	"max_health": 0.0,
	"min_health": 0.0
}

var _properties:Dictionary = {
	"current_health": 0.0,
	"previous_health": 0.0,
	"is_dead":false
}

@onready var default_stats = _stats
@onready var default_properties = _properties

@warning_ignore("unused_signal")
signal health_changed(delta:float)
@warning_ignore("unused_signal")
signal is_dead(bool)

func _ready() -> void:
	reset_health(self.get_parent())

static func reset_health(body:Node) -> void:
	var health = body.health
	var stats = health._stats
	var properties = health._properties
	
	HealthModules.reset_health(stats, properties)
	
	health.health_changed.emit(Health.get_change_in_health(health))
	health.is_dead.emit(properties.is_dead)

static func damage(body:Node, amount) -> void:
	var health = body.health
	var stats = health._stats
	var properties = health._properties
	
	HealthModules.damage(stats, properties, amount)
	HealthModules.clamp_health(stats, properties)
	HealthModules.check_is_dead(stats, properties)
	
	health.health_changed.emit(Health.get_change_in_health(health))
	health.is_dead.emit(properties.is_dead)

static func heal(body:Node, amount) -> void:
	var health = body.health
	var stats = health._stats
	var properties = health._properties
	
	HealthModules.heal(stats, properties, amount)
	HealthModules.clamp_health(stats, properties)
	HealthModules.check_is_dead(stats, properties)
	
	health.health_changed.emit(Health.get_change_in_health(health))
	health.is_dead.emit(properties.is_dead)

#helper functions
static func get_change_in_health(health:Health) -> float:
	return health._properties.current_health - health._properties.previous_health

static func get_health_fraction(health:Health) -> float:
	if health._stats.max_health == 0.0: return 0.0
	return health._properties.current_health / health._stats.max_health

static func get_is_dead(body:Node) -> bool:
	return body.health._properties.is_dead
