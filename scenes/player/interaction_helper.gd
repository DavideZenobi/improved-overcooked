extends Object

var player = preload("res://scenes/player/player.tscn");

func handle_drop():
	
	pass;

func handle_take(interactable_object: Node):
	## El unico caso en el que pueda servir coger algo y que no este en ninguna caja
	## es coger un ingrediente de una ingredient box, la cosa es que esta caja SIEMPRE
	## tendra el nodo SupportableObjectHolder, por lo tanto si no lo tiene,
	## no se puede interactuar y el metodo no hace nada.
	if not interactable_object.has_node("SupportableObjectHolder"): return;
	else:
		var soh = interactable_object.get_node("SupportableObjectHolder");
		if not soh.current_supportable_object:
			
			pass;
	
