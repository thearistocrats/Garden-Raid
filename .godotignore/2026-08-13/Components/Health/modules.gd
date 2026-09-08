class_name HealthModules extends Node

static func check_is_dead(stats:Dictionary, properties:Dictionary) -> void:
	properties.is_dead = properties.current_health <= stats.min_health

static func damage(_stats:Dictionary, properties:Dictionary, incoming_damage:float) -> void:
	properties.previous_health = properties.current_health
	properties.current_health -= incoming_damage

static func heal(_stats:Dictionary, properties:Dictionary, incoming_heal:float) -> void:
	properties.previous_health = properties.current_health
	properties.current_health += incoming_heal

static func clamp_health(stats:Dictionary, properties:Dictionary) -> void:
	if properties.current_health > stats.max_health: 
		properties.current_health = stats.max_health  
	if properties.current_health < stats.min_health: 
		properties.current_health = stats.min_health  

static func reset_health(stats:Dictionary, properties:Dictionary) -> void:
	properties.current_health = stats.max_health
	properties.is_dead = false

#helper functions
static func validate_health_component(stats:Dictionary, _properties:Dictionary) -> void:
	if stats.min_health > stats.max_health: 
		stats.max_health = stats.max_health
