extends Node
class_name Manager

signal UpdateInventory
signal NextRoom

func _process(delta):
	if Input.is_action_just_pressed("NEXT ROOM (TEXT)"):
		print("nextRoom")
		NextRoom.emit()
