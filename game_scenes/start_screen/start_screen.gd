extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_3_pressed():
	#get_tree().get_root().add_child(preload("res://home_screen.tscn").instantiate())
	get_tree().change_scene_to_file("res://game_scenes/prompts_screen/starting_prompts.tscn")
	hide ()



func _on_button_pressed():
	get_tree().change_scene_to_file("res://game_scenes/options_screen/options_screen.tscn")
	hide ()


func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://game_scenes/help_screen/help_screen.tscn")
	hide ()
