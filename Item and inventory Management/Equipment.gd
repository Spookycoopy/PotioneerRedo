extends Node2D
class_name EquipManager

@export var Current_item : Item

@onready var equipSprite : Sprite2D = $Equip
func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1 and Current_item != null :
			Current_item.Interact()
			
			if Current_item and Current_item.item_type == "Potion": unequip()

func _process(_delta):
	look_at(get_global_mouse_position())

func Equip(item : Item):
	Current_item = item
	equipSprite.texture = item.item_icon
	Current_item.Spawn()

func RemoveEquip():
	Current_item.queue_free()
	Current_item = null
	equipSprite.texture = null
	return

func unequip():
	Current_item = null
	equipSprite.texture = null
