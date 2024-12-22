extends Node

# Diccionario para mapear tipos de ingredientes a sus escenas
var ingredient_scenes: Dictionary = {
	"meat": preload("res://scenes/ingredients/meat.tscn"),
	##"fish": preload("res://scenes/Fish.tscn"),
	##"tomato": preload("res://scenes/Tomato.tscn")
}

func spawn_ingredient(ingredient_type: String, spawn_position: Vector3) -> void:
	# Verifica si existe la escena asociada al tipo
	if not ingredient_scenes.has(ingredient_type):
		print("Error: No scene found for ingredient type: ", ingredient_type)
		return

	# Instancia la escena correspondiente
	var ingredient_scene = ingredient_scenes[ingredient_type]
	var ingredient_instance = ingredient_scene.instantiate()

	# Agrega la instancia al árbol
	add_child(ingredient_instance)
	
	# Posiciona la instancia en el mundo
	ingredient_instance.global_transform.origin = spawn_position
	print("Spawned ingredient of type: ", ingredient_type, " at position: ", spawn_position)
