extends MarginContainer
class_name slot

signal on_slot_clicked(item, index, button)

@onready var Icon : TextureRect = $MarginContainer/TextureRect
@onready var QuantityLabel : Label = $QuantityLabel

@export var equippable : bool

var slot_item : Item

func set_slot_data(item : Item):
	if item == null:
		Icon.texture = null
		QuantityLabel.text = ""
		return
	Icon.texture = item.item_icon
	QuantityLabel.text = "x" + str(item.item_stack)
	
	slot_item = item

func _on_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1:
			on_slot_clicked.emit(slot_item, get_index(), event.button_index)
