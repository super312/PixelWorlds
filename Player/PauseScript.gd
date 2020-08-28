extends Node

var is_paused = false

onready var label = $"../Label"

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		if is_paused:
			label.visible = false
			get_tree().paused = false
			is_paused = false
		else:
			label.visible = true
			get_tree().paused = true
			is_paused = true

