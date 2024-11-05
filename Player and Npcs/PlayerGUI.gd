extends Control

@onready var player : Player = get_tree().get_first_node_in_group("Player")
@onready var info : NPCInfo = player.player_info

@onready var hp_lbl = $VBoxContainer/Health
@onready var def_lbl = $VBoxContainer/Defense
@onready var sp_lbl = $VBoxContainer/Speed

func _process(delta):
	hp_lbl.text = "hp: " + str(info.health)
	def_lbl.text = "def: " + str(info.defense)
	sp_lbl.text = "sp: " + str(info.speed)
