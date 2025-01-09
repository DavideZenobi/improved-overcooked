extends Node
class_name IngredientBox;

@export var ingredient_box_type: String = "default";

func get_ingredient_box_type() -> String:
	return ingredient_box_type
