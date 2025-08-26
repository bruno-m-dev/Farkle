extends Node2D


@onready var DICE_MANAGER_PATH = $"../DiceManager"


var diceRoll: Array[int] = [0,0,0,0,0,0]


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()


func dice_roll():
	
	$"../DieShuffle1".play()
	await get_tree().create_timer(1.7).timeout
	$"../DieThrow1".play()
		
	for i in range(6):
		diceRoll[i] = randi_range(1,6)
		#print("res://Dice/dieRed" + str(tirada_dados[i]) + ".png")
		var diceRed = DICE_MANAGER_PATH.get_node_or_null("Dice%d" % (i + 1))		
		if diceRed == null:
			push_error("no se encuentra Dice%d" % (i + 1))
		else:
			diceRed.texture = load("res://Images/Dice/dieRed_border" + str(diceRoll[i]) + ".png")
			diceRed.visible= true
		
		
				
	print (diceRoll)
	
	
	
func invisibilizar_dados():
	for i in range(6):
		var diceRed = DICE_MANAGER_PATH.get_node("Dice" + str(i + 1))
		diceRed.visible= false
		
func get_dice_status():
	for i in range(6):
		var diceRed = DICE_MANAGER_PATH.get_node("Dice" + str(i + 1))
		if diceRed.visible == false: 
			return false
		else:
			return true
	
func _on_tirar_dados_pressed() -> void:
	recoger_dados()
	await get_tree().create_timer(1.3).timeout
	invisibilizar_dados()
	
	animacion_cubilete()
	recoger_dados()
	$DiceManager.dice_roll()

func animacion_cubilete():
	
	
	
	$ShakeDiceCupAnimation.visible= true
	$ShakeDiceCupAnimation/Sprite2D/ShakeDiceCup.play()
	await get_tree().create_timer(1.7).timeout
	$ShakeDiceCupAnimation/Sprite2D/ShakeDiceCup.stop()
	$ShakeDiceCupAnimation.visible= false
	
func recoger_dados():
	
	
	
	$PickUpDiceAnimation.visible= true
	$PickUpDiceAnimation/Sprite2D/PickUpDice.play()
	await get_tree().create_timer(1.5).timeout
	$PickUpDiceAnimation/Sprite2D/PickUpDice.stop()
	$PickUpDiceAnimation.visible= false

#MUESTRA TEXTURA DICE_WHITE CUANDO SE PASA EL RATON POR ENCIMA DEL DADO EN EL TABLERO. NO ESTÁ FUNCIONANDO.
