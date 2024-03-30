extends Node
class_name EffectHandler

@onready var playerInfo : NPCInfo = $"..".player_info
@onready var current_effects : Array[Effect]

@onready var timer : Timer = $"../EffectTimeManager"

func _ready():
	GameManager.NextRoom.connect(nextRoom)

func add_effect(effect : Effect):
	if effect.Usable:
		use_effect(effect)

func use_effect(effect : Effect):
	playerInfo.Health += effect.healing * effect.falloff
	print(playerInfo.Health, " ", effect.healing * effect.falloff)
	playerInfo.Health = clamp(playerInfo.Health, 0, playerInfo.MaxHealth)
	
	playerInfo.SPEED += effect.speed * effect.falloff
	playerInfo.Defense += effect.defense * effect.falloff
	
	effect.tick = effect.Maxtick
	
	if not effect.OneShot and effect.effect != null:
		var new_effect : EffectClass = effect.effect.instantiate()
		
		effect.current_Effect = new_effect
		new_effect.target_info = playerInfo
		add_child(new_effect)
	elif effect.OneShot: reset_effect(effect)
	
	current_effects.append(effect)

func _on_effect_time_manager_timeout():
	for ef in current_effects:
		if ef.OneShot or ef.effect == null: return
		ef.tick -= 1
		if ef.current_Effect : ef.current_Effect.tick()
		
		if ef.tick < 0:
			ef.tick = ef.Maxtick

func nextRoom():
	for ef in current_effects:
		ef.duration -= 1
		
		if ef.duration <= 0:
			removeEffect(ef)

func removeEffect(ef : Effect):
	if ef.current_Effect: ef.current_Effect.queue_free()
	
	reset_effect(ef)
	current_effects.remove_at(current_effects.find(ef))

func reset_effect(ef : Effect):
	playerInfo.Defense -= ef.defense * ef.falloff
	playerInfo.SPEED -= ef.speed * ef.falloff

