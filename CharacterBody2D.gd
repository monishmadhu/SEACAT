extends CharacterBody2D

var move=false
var vel : Vector2=Vector2()
@onready var sprite : Sprite2D =get_node("Icon")

func _process(delta):
	#if Input.is_action_pressed("move_right"):
		#move=true
	#if move:
		#position += Vector2(3, 0)
		#modulate = Color8(40,183,215)
	pass
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
