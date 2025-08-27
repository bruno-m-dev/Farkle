extends Area2D

func _on_mouse_entered() -> void:
	print ("DEBUG: mouse entra área2D dice4")
	$"../../GreenShadowDice4".visible = true

func _on_mouse_exited() -> void:
	print ("DEBUG: mouse sale área2D dice4")
	$"../../GreenShadowDice4".visible = false
