extends Node

var mesh_instance: MeshInstance3D

func _ready():
	mesh_instance = get_parent().get_node("MeshInstance3D")
	if mesh_instance.material_override == null:
		mesh_instance.material_override = StandardMaterial3D.new()

func _on_area_entered(area: Area3D):
	if area.name == "AreaToInteract":
		highlight_box()
		print("Hola")

func _on_area_exited(area: Area3D):
	if area.name == "AreaToInteract":
		reset_box()

func highlight_box():
	mesh_instance.material_override.albedo_color = Color.YELLOW

func reset_box():
	mesh_instance.material_override.albedo_color = Color.WHITE
