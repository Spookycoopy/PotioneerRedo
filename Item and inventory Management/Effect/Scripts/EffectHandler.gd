extends Node
class_name EffectHandler

signal Ef_Tick

@onready var playerInfo : NPCInfo = $"..".player_info
@onready var current_effects : Array[Effect]

@onready var timer : Timer = $"../EffectTimeManager"

func _ready():
	GameManager.NextRoom.connect(nextRoom)

func Begin_Tick():
	for ef in current_effects:
		ef.queued = true
		if ef.OneShot: return
		ef.tick -= 1
		
		if ef.tick <= 0:
			ef.tick = ef.Max_Tick
			
			if ef.current_Effects != null : 
				for i in ef.current_Effects:
					i.tick()
			
			EffectInfo.Update_Effect_On_Target(ef, playerInfo)
			ef.queued = false

func add_effect(effect : Effect):
	use_effect(effect)

func use_effect(effect : Effect):
	
	EffectInfo.set_effect_to_player(effect, playerInfo)
	if not effect.OneShot and effect.Custom_effects != null: add_custom_effect(effect)
	elif effect.OneShot: reset_effect(effect)
	
	current_effects.append(effect)

func _on_effect_time_manager_timeout():
	Begin_Tick()

func nextRoom():
	for ef in current_effects:
		ef.duration -= 1
		
		if ef.duration <= 0:
			await (ef.queued == false)
			
			removeEffect(ef)

func removeEffect(ef : Effect):
	if ef.current_Effect: ef.current_Effect.queue_free()
	
	reset_effect(ef)
	current_effects.remove_at(current_effects.find(ef))

func reset_effect(ef : Effect):
	playerInfo.defense -= ef.defense * ef.falloff
	playerInfo.speed -= ef.speed * ef.falloff

func add_custom_effect(ef : Effect): 
	for effect in ef.Custom_effects:
		var new_effect : EffectClass = effect.instantiate()
		
		ef.current_Effects.append(new_effect)
		new_effect.target_info = playerInfo
		new_effect.effect_info = ef
		
		Ef_Tick.connect(new_effect.tick)
		
		add_child(new_effect)
