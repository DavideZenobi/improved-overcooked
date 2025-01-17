extends Node

var current_level;

var ingredient_scenes: Dictionary = {
	"meat_raw": preload("res://scenes/ingredients/meat_raw.tscn"),
	"egg_fried": preload("res://scenes/ingredients/egg_fried.tscn"),
	"egg_raw": preload("res://scenes/ingredients/egg_raw.tscn"),
	"fish": preload("res://scenes/ingredients/fish.tscn"),
}

## Change scene (start menu, level 2, etc)
func load_scene(scene_name: String):
	
	return;

func instantiate_scene(scene_name: String, position: Vector3, parent_node: Node = null) -> Node:
	
	if not ingredient_scenes.has(scene_name):
		print("Error: No scene found for ingredient type: ", scene_name);
		return;
	
	var scene_to_instantiate = ingredient_scenes[scene_name];
	var scene_instance = scene_to_instantiate.instantiate();
	
	## Si existe parent_node, hay que añadir la instancia como hijo
	## Es importante para que la escena instanciada siga la escena padre
	## En este caso para llevar objetos, como los ingredientes
	if parent_node != null:
		parent_node.add_child(scene_instance);

	scene_instance.global_transform.origin = position;
	
	print("Ingredient ", scene_instance.name, " created!");
	return scene_instance;
func reparent_scene(scene_to_reparent: Node, new_position: Vector3, new_parent: Node = null) -> Node:
	var old_parent = scene_to_reparent.get_parent();
	old_parent.remove_child(scene_to_reparent);
	new_parent.add_child(scene_to_reparent);
	scene_to_reparent.global_transform.origin = new_position;
	return scene_to_reparent;

func delete_node(node: Node):
	print("Eliminating ", node.name, " from parent ", node.get_parent());
	node.queue_free();
	return;
