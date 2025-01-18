extends Node

## Este script habilita la mecánica de apoyar objetos.
##
## IMPORTANTE
## Es requisito que la escena donde se aplique este componente,
## tenga un nodo referencia donde se va a apoyar el objeto.
## IMPORTANTE

var current_supportable_object: Node = null;

func support(supportable_object: Node):
	if current_supportable_object:
		print("Ya existe un objeto. No se puede apoyar");
		return;
	
	current_supportable_object = supportable_object;

func unsupport():
	current_supportable_object = null;
