extends CharacterBody3D

@export var speed = 3
@export var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")

func _process(delta):
	if Input.is_action_just_pressed("take_or_drop"):
		if $CarryingObject.current_carrying_object:
			if $AreaToInteract.closest_interactable_object:
				## Can try to support the object on the table/furniture/etc if its possible
				handle_drop();
				pass;
			else:
				## Nothing happens. Could try to drop the object on the floor in the future
				pass;
		else:
			if $AreaToInteract.closest_interactable_object:
				## Interact with the object
				handle_take();
				pass;
			pass;
		
		if $AreaToInteract.interactable_object:
			var ingredient_type = $AreaToInteract.interactable_object.get_ingredient_type()
			var holding_point: Vector3 = $HoldingPoint.global_transform.origin
			## SceneManager.spawn_ingredient(ingredient_type, holding_point)
			SceneManagerV2.instantiate_scene(ingredient_type, holding_point, self)

func _physics_process(delta):
	var direction = Vector3(0, 0, 0)
	## Check for movement inputs
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_back"):
		direction.z += 1
	if Input.is_action_pressed("move_forward"):
		direction.z -= 1
	if direction != Vector3.ZERO:
		direction = direction.normalized()
	
	handle_movement(direction, delta)

func handle_movement(direction: Vector3, delta: float):
	## Check if character is falling and add gravity/velocity
	if not is_on_floor():
		velocity.y -= gravity * delta
	else:
		velocity.y = 0
	
	## Calculate velocity
	velocity = Vector3(direction.x * speed, velocity.y, direction.z * speed)
	
	## Rotate if its moving
	if direction != Vector3.ZERO:
		var target_rotation = atan2(direction.x, direction.z)
		rotation.y = target_rotation
	
	move_and_slide()

func handle_take():
	## Primero se controla si tiene algun objeto apoyado ya que tiene prioridad.
	## Segundo
	pass;

func handle_drop():
	pass;
