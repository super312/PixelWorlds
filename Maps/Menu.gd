extends Node2D

var state = true

var background = ["res://Paralax.png","res://Paralax_dark.png"]

onready var anim = $AnimationPlayer

func change():
	if state:
		anim.play("Fade-in")
		yield(anim,"animation_finished")
		$Bush2.visible = true
		$TileMap2.visible = true
		$tree2.visible = true
		$Flowers2.visible = true
		$ExtraTiles.visible = true
		$ParallaxBackground/ParallaxLayer/Sprite.texture = load(background[1])
		state = false
		anim.play("Fade-out")
	else:
		anim.play("Fade-in")
		yield(anim,"animation_finished")
		$Bush2.visible = false
		$TileMap2.visible = false
		$tree2.visible = false
		$Flowers2.visible = false
		$ExtraTiles.visible = false
		$ParallaxBackground/ParallaxLayer/Sprite.texture = load(background[0])
		state = true
		anim.play("Fade-out")
	

func _on_Timer_timeout():
	change()
