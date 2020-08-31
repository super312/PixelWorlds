extends KinematicBody2D

var life = 3

var vector = Vector2()
var speed = 900
var accel = 300
var grav = 20

onready var anim = $Anim
onready var spr = $Sprite
onready var but = $Xbutton

export var cx_limit = 10000000
export var cy_limit = 1224

var state = 0
var dir = 0

var body = null

func _ready():
	$Camera2D.limit_bottom = cy_limit

func _physics_process(delta):
	
	vector.y += grav
	var friction = false
	var x = 0
	
	if Input.is_action_just_pressed("ui_select") and body != null:
		if body.has_method("interact"):
			body.interact()
	
	if is_on_floor():
		
		if Input.is_action_pressed("ui_left"):
			vector.x = max(vector.x - accel, -(speed * delta * 30))
			x += 1
			state = 1
			dir = 1
		if Input.is_action_pressed("ui_right"):
			vector.x = min(vector.x + accel, speed * delta * 30)
			x -= 1
			state = 1
			dir = 0
		if x == 0:
			friction = true
			state = 0
		
		if Input.is_action_pressed("ui_down") and Input.is_action_just_pressed("ui_up"):
			translate(Vector2(0,1))
		elif Input.is_action_just_pressed("ui_up"):
			vector.y -= 750
		if friction:
			vector.x = lerp(vector.x, 0, 0.3)
	else:
		state = 2
		if Input.is_action_pressed("ui_left"):
			vector.x = max(vector.x - accel/4, -(speed * delta * 30))
			x += 1
		if Input.is_action_pressed("ui_right"):
			vector.x = min(vector.x + accel/4, speed * delta * 30)
			x -= 1
		if x == 0:
			friction = true
		
		if friction:
			vector.x = lerp(vector.x, 0, 0.01)
		pass
	
	anim()
	vector = move_and_slide(vector, Vector2.UP)

func anim():
	match dir:
		0:
			spr.flip_h = false
		1:
			spr.flip_h = true
	
	match state:
		0:
			anim.play("Idle")
		1:
			anim.play("Walk")
		2:
			if vector.y < 0:
				anim.play("Jump_up")
			else:
				anim.play("Jump_down")
	pass

func _on_Interaction_area_body_entered(_body):
	body = _body
	but.visible = true
func _on_Interaction_area_body_exited(_body):
	body = null
	but.visible = false
