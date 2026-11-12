class_name HealthModules extends Node

static func get_change_in_death_state(health:Health) -> bool:
	var stats = health._stats
	var properties = health._properties
	var previous_death_state = properties.death_state
	
	properties.death_state = properties.current_health <= stats.min_health
	return properties.death_state != previous_death_state

static func get_change_in_health(health:Health) -> float:
	var properties = health._properties
	return properties.current_health - properties.previous_health
	
static func clamp_health(health:Health) -> void:
	var stats = health._stats
	var properties = health._properties
	
	if properties.current_health > stats.max_health: 
		properties.current_health = stats.max_health  
	if properties.current_health < stats.min_health: 
		properties.current_health = stats.min_health  

static func get_health_fraction(health:Health) -> float:
	if health._stats.max_health == 0.0: return 0.0
	return health._properties.current_health / health._stats.max_health
