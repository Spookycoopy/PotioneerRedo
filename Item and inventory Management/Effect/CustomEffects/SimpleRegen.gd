extends EffectClass


func tick():
	super()
	target_info.heal(2 * effectiveness)
