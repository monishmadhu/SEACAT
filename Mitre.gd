extends Node

var attack_dict={}
var defend_dict={}
var timeline_dict={}
var red_objective=""
var blue_objective=""
var time_limit = 300
var attack_time_cost = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	import_resources_data()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func import_resources_data():
	var file= FileAccess.open("res://data/ATT&CK_database.txt", FileAccess.READ)
	while !file.eof_reached():
		var attack_data_set = Array(file.get_csv_line())
		attack_dict[attack_dict.size()] = attack_data_set
	file.close()
	
	var file2= FileAccess.open("res://data/D3FEND_Names.txt", FileAccess.READ)
	while !file2.eof_reached():
		var defense_data_set = Array(file2.get_csv_line())
		defend_dict[defend_dict.size()] = defense_data_set
	file2.close()
	
	var file3 = FileAccess.open("res://data/example_mission_timeline.txt", FileAccess.READ)
	while !file3.eof_reached():
		var timeline_data_set = Array(file3.get_csv_line())
		timeline_dict[timeline_dict.size()] = timeline_data_set
	file3.close()
