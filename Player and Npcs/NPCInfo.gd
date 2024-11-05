extends Resource
class_name NPCInfo

@export var MaxHealth : float
@export var health : float

@export var InitalSpeed : float
@export var speed : float

@export var InitalDefense : float
@export var defense : float

func TakeDamage(dmg : float):
	self.NPC_Status.health -= dmg/ self.defenses

func heal(health : float):
	self.health += health
	self.health = clamp(self.health, 0, self.MaxHealth)
