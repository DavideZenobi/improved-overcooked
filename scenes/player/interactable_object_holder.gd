extends Node

var interactable_objects: Array = [];

var current_interactable_object: Node = null

func _interactable_object_on_area_entered(area: Area3D):
	interactable_objects.append(area.get_parent());
	update_current_interactable_object();

func _interactable_object_on_area_exited(area: Area3D):
	if not interactable_objects.is_empty():
		interactable_objects.erase(area.get_parent());
		update_current_interactable_object();

func update_current_interactable_object():
	## Si no hay objetos en la array, no hay objeto más cercano.
	if interactable_objects.is_empty():
		current_interactable_object = null;
		print("No interactable object near");
		return;
	
	## Si solo hay un objeto, ese será el único con el que interactuar.
	if interactable_objects.size() == 1:
		current_interactable_object = interactable_objects[0];
		return;
	
	var player_position = get_parent().global_transform.origin;
	var min_distance = INF;
	var tmp_interactable_object = null;
	
	for obj in interactable_objects:
		var distance = player_position.distance_to(obj.global_transform.origin);
		if distance < min_distance:
			tmp_interactable_object = obj;
			min_distance = distance;
	
	current_interactable_object = tmp_interactable_object;
	print("Current interactable object: ", current_interactable_object);
