extends Node2D


func _ready():
	
	$HUD/DiceRollButton.deactivate_button($HUD/FinalCountAndShiftChangeButton)
	$HUD/DiceRollButton.deactivate_button($HUD/DiceSelectionButton)
	$HUD/DiceRollButton.deactivate_button($HUD/PartialCountAndNewDiceRollButton)
	


		

	
