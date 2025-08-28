extends Area2D
@onready var dice_roll_script_path = get_node("../../../HUD/DiceRollButton")
@onready var dice_selection_button_path = get_node("../../../HUD/DiceSelectionButton")



var dice_selection_available = false
var click_position = Vector2()
var mouse_enter = false
var mouse_exit = false



func _physics_process(delta) -> void:
	if Input.is_action_just_pressed("left_click"):
		click_position = get_global_mouse_position()
		print ("DEBUG: hizo click en: " + str(click_position))
		

func _on_mouse_entered() -> void:
	
	#Actualiza variables
	dice_selection_available = true
	mouse_enter = true
	mouse_exit = false
	
	print ("DEBUG: mouse entra área2D dice1")
	#Hace visible sombra verde detras del dado (SELECCIONABLE)
	$"../../GreenShadowDice1".visible = true
	
	#Si el puntero del mouse entra del area del dado, el boton "SELECCIONAR DADO" se activa
	if mouse_enter == true :
		dice_roll_script_path.activate_button(dice_selection_button_path)
	
		
func _on_mouse_exited() -> void:
	
	#Actualiza variables
	dice_selection_available = false
	mouse_enter = false
	mouse_exit = true
	
	#Hace invisible la sombra verde detras del dado (NO SELECCIONABLE)
	print ("DEBUG: mouse sale área2D dice1")
	$"../../GreenShadowDice1".visible = false
	
	#Si el puntero del mouse sale del area del dado, el boton "SELECCIONAR DADO" se desactiva
	if mouse_exit == true:
		dice_roll_script_path.deactivate_button(dice_selection_button_path)
