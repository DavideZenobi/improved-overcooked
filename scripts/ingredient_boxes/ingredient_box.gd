extends Node
class_name IngredientBox;

@export var ingredient: String;

func get_ingredient_box_type() -> String:
	return ingredient;
