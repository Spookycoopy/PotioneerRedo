extends CanvasLayer

@onready var QuickItems : HBoxContainer = $QuickItems/Background/MarginContainer/GridContainer
@onready var Ingredient_Inventory : GridContainer = $Inventory/Ingredients/Panel/MarginContainer/GridContainer

@export var Slot : PackedScene

var player : Player
var inv : Inventory
# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_tree().get_first_node_in_group("Player")
	inv = player.inv
	
	for n in 15:
		var new_slot : slot = Slot.instantiate()
		new_slot.on_slot_clicked.connect(equip_from_slot)
		
		Ingredient_Inventory.add_child(new_slot)
		new_slot.set_slot_data(null)
	
	GameManager.UpdateInventory.connect(UpdateInventory)
	GameManager.UpdateInventory.emit()

func equip_from_slot(item : Item, index, button):
	player.equipment.Equip(item)

func UpdateInventory():
	Update_QuickItems()
	Update_Ingrident()

func Update_Ingrident():
	var updated_inv : Array = inv.inv_ingridents
	for obj in updated_inv:
		for sl : slot in Ingredient_Inventory.get_children():
			if sl.slot_item != null : return
			sl.set_slot_data(obj)
			break

func Update_QuickItems():
	var updated_inv : Array = inv.get_inventory()
	for n in 3:
		var slo : slot
		var children = QuickItems.get_children()
		if not children[n].on_slot_clicked.is_connected(equip_from_slot):
			children[n].on_slot_clicked.connect(equip_from_slot)
		
		if updated_inv[n] != null and updated_inv[n].item_stack <= 0: updated_inv[n] = null
		children[n].set_slot_data(updated_inv[n])
