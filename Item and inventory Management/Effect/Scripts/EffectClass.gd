extends Node
class_name EffectClass

@export var effect_info : Effect
@export var effectiveness : float = 1

var target_info : NPCInfo
func enter():
	return

func tick():
	
	if effect_info.tick > 0: return

func exit():
	queue_free()
	return
