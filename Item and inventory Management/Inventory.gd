extends Node
class_name Inventory

@export var inv_items : Array[Item]
@export var inv_ingridents : Array[Ingrident_Resource]
@export var max_size : int

func _ready():
	Update_inventory()
	
func get_inventory():
	Update_inventory()
	return inv_items

func Update_inventory():
	inv_items.clear()
	for child in get_children():
		if child is Item:
			inv_items.append(child)
	inv_items.resize(max_size - 1)
