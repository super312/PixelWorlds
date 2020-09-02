extends ParallaxBackground

func change(x):
	match x:
		0:
			$ParallaxLayer/Sprite.texture = load("res://Paralax.png")
		1:
			$ParallaxLayer/Sprite.texture = load("res://Paralax_dark.png")
