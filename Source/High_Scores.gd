extends Control
var names
var scores
var delay = null

func _ready():
	global.current_scene = "High_Scores"
	get_child(0).set_title("High Scores")
	get_child(0).popup()
	scores = "  NAMES \t\t\t\t\t\tSCORES\n\n"
	global.SCORES.sort()
	for i in range(2, global.SCORES.size()):
		scores = scores + str(i-1)+" "+ global.SCORES[i][0] + "\t\t\t\t\t\t"
		scores = scores + global.SCORES[i][1] + "\n\n"
	get_node("WindowDialog/Label").set_bbcode(scores)
	delay = Timer.new()
	delay.set_wait_time(1)
	delay.set_one_shot(true)
	delay.connect("timeout", self, "ok")
	add_child(delay)
	delay.start()

func ok():
	set_fixed_process(true)

func _fixed_process(delta):
	if(Input.is_action_pressed("score")):
		get_tree().change_scene("res://Main menu.tscn")

