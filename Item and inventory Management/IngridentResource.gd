extends Resource
class_name Ingrident_Resource

@export_category("Ingrident Setting")
@export var ingri_name : String
@export_multiline var ingri_discription : String
@export var ingri_icon : CompressedTexture2D
@export var quantity : int
@export var capacity : int
@export var effect : Effect

@export_category("Ingrident Recipe")
@export var craftable : bool
@export var Ingrident_recipe_1 : Ingrident_Resource
@export var Ingrident_recipe_2 : Ingrident_Resource


