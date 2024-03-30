extends Resource
class_name Effect

var current_Effect : EffectClass
var tick : int

@export_category("Effect Settings")
@export var Usable : bool
@export var OneShot : bool
@export var effect : PackedScene

@export_category("Stats")
@export var healing : float
@export var speed : float
@export var defense : float
@export var Phys_Moves : float
@export var Magic_Moves : float
@export var Maxtick : int
@export var duration : float
@export var falloff: float
