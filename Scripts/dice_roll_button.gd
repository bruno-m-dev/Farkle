extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print ("DEBUG: Se carga escena HUD")



func _on_pressed() -> void:
	#EL CODIGO DEL IF SE EJECUTA CUANDO SE ABRE EL JUEGO. 
	#AL NO HABER AÚN DADOS VISIBLES EN EL TABLERO, SOLO EJECUTA LA ANIMACIÓN DE AGITAR EL CUBILETE.
	print("DEBUG: DiceRollButton presionado por el jugador. Primera ejecución")
	
	#TO DO: ojo utilizar func get_dice_status creada en dice_manager.gd en lugar de is-visible-in-tree
	if $"../../DiceManager/Dice1".is_visible_in_tree() == false:  #SI EL DADO AÚN NO ES VISIBLE 
		$"../../DiceManager".animacion_cubilete()
		$"../../DiceManager".dice_roll()
		deactivate_button($"../DiceRollButton")
		
		#Habilita boton de seleccionar dados si está deshabilitado
		#if $"../DiceSelectionButton".disabled == true:
			#activate_button($"../DiceSelectionButton")
		
	#EL CODIGO DEL ELSE SE EJECUTA CUANDO SE ABRE EL JUEGO. 
	#AL HABER DADOS VISIBLES EN EL TABLERO, SE EJECUTAN LAS ANIMACIONES DE RECOGER DADOS + AGITAR EL CUBILETE.	
	else:
		print("DEBUG: DiceRollButton presionado por el jugador")
		$"../../DiceManager".recoger_dados()
		await get_tree().create_timer(1.3).timeout
		$"../../DiceManager".invisibilizar_dados()
		
		$"../../DiceManager".animacion_cubilete()
		$"../../DiceManager".recoger_dados()
		$"../../DiceManager".dice_roll()
		
		activate_button($".")
		
	
	

#verifica si el Button recibido como parametro está activado y si lo está, lo desactiva. 	
func deactivate_button(button: Button) -> void:
	button.disabled = true
	print("DEBUG: Desactivado botón: " + str(button))

func activate_button(button: Button) -> void:
	button.disabled = false
	print("DEBUG: Activado botón: " + str(button))
