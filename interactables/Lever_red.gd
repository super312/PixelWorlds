extends StaticBody2D

export var interact : NodePath
export var state = false

onready var itr = get_node(interact)
onready var sprite = $Sprite

export var lever_type = 0

var sprite_path = ["res://Sprites/lever_red.png","res://Sprites/lever_blue.png"]

func _ready():
	sprite.texture = load(sprite_path[lever_type])

func interact():
	if state:
		itr.state = false
		itr.update()
		state = false
		sprite.flip_h = false
	else:
		itr.state = true
		itr.update()
		state = true
		sprite.flip_h = true

