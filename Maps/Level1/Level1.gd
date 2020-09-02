extends Node2D

var state = false
var player = null

onready var pla = $Player
onready var anim = $AnimationPlayer

func _physics_process(delta):
	
	if $Player.position.y > 630:
		$Player.position = $Respawn.position
	
	if Input.is_action_just_pressed("UI_Change"):
		
		if pla.is_on_floor():
			anim.play("fade_in")
			yield(anim,"animation_finished")
			
			if player != null:
				player.position = $WallArea/Postion.position
			
			if state:
				$TileMap.visible = true
				$TileMap.set_collision_layer_bit(1,true)
				$TileMap2.visible = false
				$TileMap2.set_collision_layer_bit(1,false)
				$Decorations.visible = true
				$Decorations_dark.visible = false
				$WallArea/CollisionShape2D.disabled = true
				$ParallaxBackground.change(0)
				state = false
			else:
				$TileMap.visible = false
				$TileMap.set_collision_layer_bit(1,false)
				$TileMap2.visible = true
				$TileMap2.set_collision_layer_bit(1,true)
				$Decorations.visible = false
				$Decorations_dark.visible = true
				$WallArea/CollisionShape2D.disabled = false
				$ParallaxBackground.change(1)
				state = true
			anim.play("fade_out")
		
	


func _on_WallArea_body_entered(body):
	player = body
func _on_WallArea_body_exited(body):
	player = null
