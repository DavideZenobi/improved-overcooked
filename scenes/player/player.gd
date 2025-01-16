extends CharacterBody3D

var InteractionHelper = preload("res://scenes/player/interaction_helper.gd").new();

@export var speed = 3
@export var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")

var current_carrying_object: Node = null;

func _process(delta):
	if Input.is_action_just_pressed("take_or_drop"):
		InteractionHelper.handle_take($InteractableArea.current_interactable_object);
		handle_take_or_drop();
	if Input.is_action_just_pressed("action"):
		pass;

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

func handle_take_or_drop():
	$InteractableArea.update_current_interactable_object();
	if not $InteractableArea.current_interactable_object:
		## Si no hay objeto con el que interactuar, no sucede nada.
		return;
	
	if current_carrying_object:
		
		pass;
	## Más tarde habrá que gestionar casos como llevar un plato e interactuar
	## con un ingrediente que si que se puede meter en el plato
	## Ejemplo: elif plato, elif sarten, elif olla, etc.
	else:
		if $InteractableArea.current_interactable_object is IngredientBox:
			print("meri meri")
		pass;

func handle_drop():
	pass;

func handle_take():
	pass;
