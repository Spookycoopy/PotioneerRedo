extends CanvasLayer

@onready var QuickItems : HBoxContainer = $QuickItems/Background/MarginContainer/GridContainer

var player : Player
var inv : Inventory
# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_tree().get_first_node_in_group("Player")
	inv = player.inv
	
	GameManager.UpdateInventory.connect(UpdateInventory)
	GameManager.UpdateInventory.emit()

func equip_from_slot(item : Item, index, button):
	player.equipment.Equip(item)

func UpdateInventory():
	Update_QuickItems()

func Update_QuickItems():
	var updated_inv : Array = inv.get_inventory()
	for n in 3:
		var slo : slot
		var children = QuickItems.get_children()
		if not children[n].on_slot_clicked.is_connected(equip_from_slot):
			children[n].on_slot_clicked.connect(equip_from_slot)
		
		if updated_inv[n] != null and updated_inv[n].item_stack <= 0: updated_inv[n] = null
		children[n].set_slot_data(updated_inv[n])
