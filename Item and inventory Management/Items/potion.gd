extends Item

@export var effect : Effect
var EffectManager : EffectHandler

func Spawn():
	EffectManager = get_parent().effectHandler

func Interact():
	EffectManager.add_effect(effect)
	super()
