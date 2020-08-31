extends Area2D

export var interact : NodePath
export var stay = true

var state = false

onready var itr = get_node(interact)

func interact():
	if state:
		itr.state = false
		itr.update()
	else:
		itr.state = true
		itr.update()

func _on_Button_body_entered(body):
	state = true
	interact()
func _on_Button_body_exited(body):
	if !stay:
		state = false
		interact()
