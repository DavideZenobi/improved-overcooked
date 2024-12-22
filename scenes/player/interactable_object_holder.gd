extends Node

var interactable_object = null

func _interactable_object_on_area_entered(area: Area3D):
	interactable_object = area.get_parent()
	pass

func _interactable_object_on_area_exited(area: Area3D):
	interactable_object = null
	pass
