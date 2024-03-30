extends CharacterBody2D
class_name Player

@export var player_info : NPCInfo

@export var inv : Inventory
@export var equipment : EquipManager
@export var effectManager : EffectHandler

@onready var SpriteAnim : AnimationPlayer = $SpriteAnimator


func _process(_delta):
	var dir = get_input_dir()
	
	velocity = dir * player_info.SPEED
	
	move_and_slide()
	anim()
	

func anim():
	if velocity.length() > 0:
		SpriteAnim.play("Walking")
	else:
		SpriteAnim.play("IDLE")
	
	if velocity.x > 0:
		$SpritePos.scale.x = -1
	elif velocity.x < 0:
		$SpritePos.scale.x = 1

func get_input_dir() -> Vector2:
	var x = (Input.get_action_raw_strength("RIGHT") - Input.get_action_raw_strength("LEFT"))
	
	var y = (Input.get_action_raw_strength("DOWN") - Input.get_action_raw_strength("UP"))
	
	return Vector2(x, y).normalized()

func get_effectManager() -> EffectHandler:
	return effectManager
