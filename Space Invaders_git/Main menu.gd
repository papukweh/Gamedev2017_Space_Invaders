extends Control


func _ready():
	global.LIVES = 5
	global.POINTS = 0
	set_fixed_process(true)

func _fixed_process(delta):
	if(Input.is_action_pressed("ui_accept")):
			get_tree().change_scene("res://Map.tscn")
