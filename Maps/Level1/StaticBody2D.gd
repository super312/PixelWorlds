extends itr_class


func update():
	if state:
		$Bush.visible = false
		$CollisionShape2D.disabled = true
	else:
		$Bush.visible = true
		$CollisionShape2D.disabled = false
