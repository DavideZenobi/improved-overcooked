extends Camera3D

var ground
# Called when the node enters the scene tree for the first time.
func _ready():
	ground = get_parent().get_node("Environment/Ground")
	if ground:
		adjust_camera(ground)
	else:
		print("Error: No environment node was found")
func adjust_camera(ground: StaticBody3D):
	var collision_shape = ground.get_node("CollisionShape3D")
	var shape = collision_shape.shape
	var x_size = shape.extents.x * 2
	var fov_radians = deg_to_rad(fov)
	var distance_required = x_size / (2 * tan(fov_radians / 2))
	var center = ground.global_transform.origin
	global_transform.origin = center + Vector3(0, distance_required, distance_required)
	look_at(center, Vector3.UP)
	print("Center: " + str(center))
	print(global_transform.origin)
	print(global_transform.basis.get_euler())
	pass

func _process(delta):
	pass
	#print("Ground: " + str(ground))
