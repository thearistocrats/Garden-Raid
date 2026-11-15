class_name Helper extends Node

static func get_siblings(node:Node) -> Array:
	var parent = node.get_parent()
	if parent == null: return []
	return parent.get_children()

static func get_sibling(node:Node, type:Variant) -> Node:
	var siblings = get_siblings(node)
	if siblings == []: return null
	for sibling in siblings:
		if sibling.get_script() == type:
			return sibling	
	return null
