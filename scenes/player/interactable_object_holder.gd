extends Node

var interactable_objects: Array = [];

var closest_interactable_object: Node = null

func _interactable_object_on_area_entered(area: Area3D):
	interactable_objects.append(area.get_parent());
	update_closest_interactable_object();

func _interactable_object_on_area_exited(area: Area3D):
	if not interactable_objects.is_empty():
		interactable_objects.erase(area.get_parent());
		update_closest_interactable_object();

func update_closest_interactable_object():
	if interactable_objects.is_empty():
		closest_interactable_object = null;
		print("No interactable object near");
		return;
	
	var player_position = get_parent().global_transform.origin;
	var min_distance = INF;
	var closest_object = null;
	
	for obj in interactable_objects:
		var distance = player_position.distance_to(obj.global_transform.origin);
		if distance < min_distance:
			min_distance = distance;
			closest_object = obj;
	
	closest_interactable_object = closest_object;
	print("Closest object: ", closest_interactable_object);
