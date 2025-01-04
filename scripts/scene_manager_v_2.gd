extends Node

var current_level;

var ingredient_scenes: Dictionary = {
	"meat": preload("res://scenes/ingredients/meat.tscn"),
}

## Change scene (start menu, level 2, etc)
func load_scene(scene_name: String):
	
	return;

func instantiate_scene(scene_name: String, position: Vector3, parent_node: Node = null) -> void:
	
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
	
	print("Official position: ", parent_node.get_node("HoldingPoint").global_transform.origin);

func delete_scene(scene: Node):
	
	return;
