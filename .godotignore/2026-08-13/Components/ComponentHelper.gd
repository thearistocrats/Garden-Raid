class_name ComponentHelper extends Node

@export var _stats:Dictionary = {}
@export var _properties:Dictionary = {}

@onready var default_stats = _stats
@onready var default_properties = _properties

#holds helper functions for the current structure of components
#all components use stats as external variables used and changed by the player, 
#and properties which are intenral variables used and changed by the component

static func set_dictionary(dictionary:Dictionary, new_dictionary:Dictionary) -> void:
	if new_dictionary == {} || dictionary == {}: return
	for key in new_dictionary.keys():
		if !dictionary.has(key): pass
		elif new_dictionary.key is Dictionary != dictionary.key is Dictionary: pass
		elif new_dictionary.key is Dictionary && dictionary.key is Dictionary:
			ComponentHelper.set_dictionary(dictionary.key, new_dictionary.key)
		else: 
			dictionary.key = new_dictionary.key

static func set_stats(object:CollisionObject2D, new_stats:Dictionary) -> void:
	ComponentHelper.set_dictionary(object.movement.stats, new_stats)
static func set_properties(object:CollisionObject2D, new_properties:Dictionary) -> void:
	ComponentHelper.set_dictionary(object.movement.properties, new_properties)
static func reset_stats(object:CollisionObject2D) -> void:
	ComponentHelper.set_dictionary(object.movement.stats, object.movement.default_stats)
static func reset_properties(object:CollisionObject2D) -> void:
	ComponentHelper.set_dictionary(object.movement.properties, object.movement.default_properties)

#template functions
'''
static func module(object:Node) -> void:
	var component = object.component
	var stats = component._stats
	var properties = component._properties
'''
