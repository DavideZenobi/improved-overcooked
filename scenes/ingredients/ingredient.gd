extends Node

class_name Ingredient;

@export var cuttable: bool;
@export var cookable: bool;
@export var cooking_time: int;

func self_destroy():
	SceneManagerV2.delete_node(self);
	pass;
