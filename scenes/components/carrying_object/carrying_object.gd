extends Node

var current_carrying_object: Node = null;

func take_object(object: Node):
	current_carrying_object = object;
	pass;

func drop_object():
	current_carrying_object = null;
	pass;
