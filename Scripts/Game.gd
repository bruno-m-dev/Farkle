extends Node2D


func _ready():
	#parche: baja el volumen del soinido del main menu hasta que encuentre la solucion. 
	$MainMenu/AudioStreamPlayer2D.volume_db =-100
	print ("DEBUG: Se carga escena Game")
	#Desactiva botones al comenzar el juego. Hasta que sean necesarios no se activarán. 
	$HUD/DiceRollButton.deactivate_button($HUD/FinalCountAndShiftChangeButton)
	$HUD/DiceRollButton.deactivate_button($HUD/DiceSelectionButton)
	$HUD/DiceRollButton.deactivate_button($HUD/PartialCountAndNewDiceRollButton)
	


		
