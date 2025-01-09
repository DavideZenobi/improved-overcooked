extends Node

# Diccionario para mapear tipos de ingredientes a sus escenas
var ingredient_scenes: Dictionary = {
	"meat_raw": preload("res://scenes/ingredients/meat_raw.tscn"),
	"fish": preload("res://scenes/ingredients/fish.tscn"),
	##"tomato": preload("res://scenes/Tomato.tscn")
}

var current_level: Node

func spawn_ingredient(ingredient_type: String, spawn_position: Vector3) -> void:
	# Verifica si existe la escena asociada al tipo
	if not ingredient_scenes.has(ingredient_type):
		print("Error: No scene found for ingredient type: ", ingredient_type)
		return

	# Instancia la escena correspondiente
	var ingredient_scene = ingredient_scenes[ingredient_type]
	var ingredient_instance = ingredient_scene.instantiate()
	
	var player = get_tree().get_root().get_node("Level1/Player")
	print(player)
	#player.add_child(ingredient_instance)
	# Agrega la instancia al árbol
	#add_child(ingredient_instance)
	
	# Posiciona la instancia en el mundo
	ingredient_instance.global_transform.origin = spawn_position
	print("Spawned ingredient of type: ", ingredient_type, " at position: ", spawn_position)
