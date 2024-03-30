extends Resource
class_name NPCInfo

@export var MaxHealth : float
@export var Health : float

@export var InitalSpeed : float
@export var SPEED : float

@export var InitalDefense : float
@export var Defense : float

func TakeDamage(dmg : float):
	Health -= dmg/Defense
