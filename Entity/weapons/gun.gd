extends Area2D

@export var bullet_damage:BulletDamage

func _ready() -> void:
	Events.on_gun_hit.connect(_on_successful_gun_hit)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("left_click"):
		var mouse_position = get_viewport().get_mouse_position()
		
		var space_state = get_world_2d().direct_space_state
		# use global coordinates, not local to node
		var query = PhysicsRayQueryParameters2D.create(global_position, mouse_position)
		var result = space_state.intersect_ray(query)
		if result:
			var collider = result.collider
			if collider.is_in_group("farmer"):
				Events.gun_fired.emit(self, collider)

static func _on_successful_gun_hit(target:Node, source:Node) -> void:
	print("successfulhit")
