extends Area2D


func _on_mouse_entered() -> void:
	print ("DEBUG: mouse entra área2D dice3")
	$"../../GreenShadowDice3".visible = true

func _on_mouse_exited() -> void:
	print ("DEBUG: mouse sale área2D dice3")
	$"../../GreenShadowDice3".visible = false
