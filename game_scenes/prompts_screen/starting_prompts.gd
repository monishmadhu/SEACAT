extends Node2D
var CTT_title 
@onready var attack_button = $Button
@onready var defend_button = $Button2
@onready var timeline_button = $Button4
@onready var file_dialog = $FileDialog
@onready var file_dialog2 = $FileDialog2
@onready var file_dialog3 = $FileDialog3
@onready var alabel = $attackfilelabel
@onready var dlabel = $defendfilelabel
@onready var tlabel = $timelinefilelabel
var attackfile = true;
var defendfile = true;
var timelinefile = true;

# Called when the node enters the scene tree for the first time.
func _ready():
	if Settings.changed_scene == 1:
		$mouse_click.playing = true
		Settings.changed_scene = 0
	
	attack_button.connect("pressed", Callable(self, "_on_attack_button_pressed"))
	defend_button.connect("pressed", Callable(self, "_on_defend_button_pressed"))
	timeline_button.connect("pressed", Callable(self, "_on_timeline_button_pressed"))
	file_dialog.connect("file_selected", Callable(self, "_on_attack_file_selected"))
	file_dialog2.connect("file_selected", Callable(self, "_on_defend_file_selected"))
	file_dialog3.connect("file_selected", Callable(self, "_on_timeline_file_selected"))
	alabel.text = "Not Selected"
	dlabel.text = "Not Selected"
	tlabel.text = "Not Selected"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_line_edit_text_submitted(new_text):
	CTT_title = new_text

func _on_attack_button_pressed():
	file_dialog.popup_centered()
	
func _on_defend_button_pressed():
	file_dialog2.popup_centered()

func _on_timeline_button_pressed():
	file_dialog3.popup_centered()

func _on_attack_file_selected(path):
	var file = FileAccess.open(path, FileAccess.READ)
	
	if file:
		var content = file.get_as_text()
		file.close()
		
		var save_path = "user://opfor_profile.txt"
		var save_file = FileAccess.open(save_path, FileAccess.WRITE)
		save_file.store_string(content)
		save_file.close()
		
		print("File saved to: ", save_path)
		attackfile = true
		alabel.text = path.get_file()
	else:
		print("error")
		
func _on_defend_file_selected(path):
	var file = FileAccess.open(path, FileAccess.READ)
	
	if file:
		var content = file.get_as_text()
		file.close()
		
		var save_path = "user://defend_profile.txt"
		var save_file = FileAccess.open(save_path, FileAccess.WRITE)
		save_file.store_string(content)
		save_file.close()
		
		print("File saved to: ", save_path)
		defendfile = true
		dlabel.text = path.get_file()
	else:
		print("error")

func _on_timeline_file_selected(path):
	var file = FileAccess.open(path, FileAccess.READ)
	
	if file:
		var content = file.get_as_text()
		file.close()
		
		var save_path = "user://mission_timeline.txt"
		var save_file = FileAccess.open(save_path, FileAccess.WRITE)
		save_file.store_string(content)
		save_file.close()
		
		print("File saved to: ", save_path)
		timelinefile = true
		tlabel.text = path.get_file()
	else:
		print("error")

func _on_button_3_pressed():
	if attackfile == true && defendfile == true && timelinefile == true:
		Settings.changed_scene = 1
		get_tree().change_scene_to_file("res://game_scenes/mission_text/mission_text.tscn")
		hide ()

func _on_button_5_pressed():
	Settings.changed_scene = 1
	get_tree().change_scene_to_file("res://game_scenes/profiles_screen/profiles_screen.tscn")
	hide()
