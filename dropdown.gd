extends Node2D

var defend_choice = -1
var attack_choice = -1
var generateACard = false
var generateDCard = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _on_attack_option_item_selected(index):
	attack_choice = index
	generateACard = true


func _on_defend_option_item_selected(index):
	defend_choice = index
	generateDCard = true
	

	
