extends ParallaxLayer

var vector = Vector2(1,0)

func _physics_process(delta):
	
	vector.x -= 0.5
	
	motion_offset = vector
