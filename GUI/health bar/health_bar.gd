class_name HealthBar extends Control

@onready var progress: TextureProgressBar = $Progress
@onready var lag: TextureProgressBar = $Lag
var health:Health = null
var lag_speed = 25.0

func _ready() -> void:
	health = Helper.get_sibling(self, Health)
	if health == null: 
		print_debug("Health not set, parent: ", get_parent())
		return
	
	top_level = true
	health.health_changed.connect(update_health)

static func update_health(delta:float) -> void:
	
	pass

func _process(delta: float) -> void:
	
	pass

'''
@export var max_health: float = 100.0

# How quickly the lag bar catches up
@export var lag_speed: float = 30.0

var current_health: float = 100.0
var lag_health: float = 100.0

func _process(delta):
	# Smoothly move lag bar toward actual health
	if lag_health > current_health:
		lag_health = move_toward(
			lag_health,
			current_health,
			lag_speed * delta
		)

	elif lag_health < current_health:
		lag_health = move_toward(
			lag_health,
			current_health,
			lag_speed * delta
		)

	lag_bar.value = lag_health


func update_health_bar():
	health_bar.value = current_health


func take_damage(amount: float):
	current_health = clampf(current_health - amount, 0.0, max_health)
	update_health_bar()


func heal(amount: float):
	current_health = clampf(current_health + amount, 0.0, max_health)
	update_health_bar()
'''
