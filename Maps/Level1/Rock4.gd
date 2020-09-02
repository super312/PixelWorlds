extends itr_class

export var invert = false

func update():
	if invert:
		if state:
			$AnimationPlayer.play_backwards("Movement")
			$CollisionShape2D.disabled = false
		else:
			$AnimationPlayer.play("Movement")
			yield($AnimationPlayer,"animation_finished")
			$CollisionShape2D.disabled = true
	else:
		if state:
			$AnimationPlayer.play("Movement")
			yield($AnimationPlayer,"animation_finished")
			$CollisionShape2D.disabled = true
		else:
			$AnimationPlayer.play_backwards("Movement")
			$CollisionShape2D.disabled = false
