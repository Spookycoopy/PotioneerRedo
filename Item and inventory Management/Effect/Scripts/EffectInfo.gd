extends Node
class_name Data_Effect

var effect_alias : Dictionary = {
	health = ["hp", "health", "healing"],
	speed = ["sp", "speed"],
	defense = ["def", "defense"],
	Physics_Moves = ["pm", "phys"],
	Magic_Moves = ["mm", "magic"],
}

func get_info(efs : String) -> Array[String]:
	var commands = efs.split("\n")
	
	var result : Array[String] = []
	for col in commands:
		var args = col.split(" ")
		
		for i in effect_alias:
			for v in effect_alias[i]:
				if args[0] == v:
					result.append(i)
					break
	
	return result

func set_effect_to_player(effect : Effect, target_info : NPCInfo):
	target_info.heal(effect.healing * effect.falloff)
	
	target_info.speed += effect.speed * effect.falloff
	target_info.defense += effect.defense * effect.falloff
	
	effect.tick = effect.Max_Tick
	return

func Update_Effect_On_Target(effect : Effect, target_info : NPCInfo):
	for stat in effect.data:
		if stat == "health":
			target_info.heal(effect.healing)
			return
		
		
		target_info
