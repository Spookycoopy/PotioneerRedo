extends Resource
class_name Effect

var current_Effects : Array[EffectClass]
var tick : int

# For error Purposes
var queued : bool
var data : Array[String]

@export_category("Effect Settings")
@export var OneShot : bool

@export var Custom_effects : Array[PackedScene]

@export_category("Stats")
@export var healing : float
@export var speed : float
@export var defense : float
@export var Physical_Moves : float
@export var Magic_Moves : float
@export var Max_Tick : int
@export var duration : int
@export var falloff : float
