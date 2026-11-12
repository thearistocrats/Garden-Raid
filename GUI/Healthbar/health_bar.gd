extends Node

@onready var back = $Back
@onready var secondary = $Secondary
@onready var primary = $Primary

var percent = 1.0
var previous_percent = 1.0
var lag = 0.0

func _init() -> void:
	pass
