extends Object

var player: CharacterBody3D;

func set_player(player_to_set: CharacterBody3D):
	player = player_to_set;

func handle_interact(interactable_object: Node):
	if player.current_carrying_object:
		print("hey hey");
		pass;
	else:
		if interactable_object:
			handle_take(interactable_object);
func handle_drop():
	
	pass;

func handle_take(interactable_object: Node):
	## El unico caso en el que pueda servir coger algo y que no este en ninguna caja
	## es coger un ingrediente de una ingredient box, la cosa es que esta caja SIEMPRE
	## tendra el nodo SupportableObjectHolder, por lo tanto si no lo tiene,
	## no se puede interactuar y el metodo no hace nada.
	if not interactable_object.has_node("SupportableObjectHolder"): return;
	
	var soh = interactable_object.get_node("SupportableObjectHolder");

	if soh.current_supportable_object:
		var object_taken = soh.current_supportable_object;
		SceneManagerV2.reparent_scene(object_taken, player.get_node("HoldingPoint").global_transform.origin, player);
		soh.unsupport();
		player.current_carrying_object = object_taken;
	elif interactable_object is IngredientBox:
		var new_ingredient = SceneManagerV2.instantiate_scene(interactable_object.get_ingredient_box_type(), player.get_node("HoldingPoint").global_transform.origin, player);
		player.current_carrying_object = new_ingredient;
	
