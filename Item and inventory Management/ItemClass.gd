extends Node2D
class_name Item

@export var item_name : String
@export_enum("Potion", "Weapon", "Ingrident") var item_type : String
@export var item_stack : int
@export var item_capacity : int
@export var item_icon : CompressedTexture2D

@export_multiline var properties : String

@export var Equipeer : EquipManager

func Spawn():
	return

func Interact():
	item_stack -= 1
	
	if item_stack <= 0:
		await Equipeer.RemoveEquip()
	GameManager.UpdateInventory.emit()
	return

func add_stack(item : Item, num):
	if item.item_name == item_name and item.properties == properties:
		item_stack += num
