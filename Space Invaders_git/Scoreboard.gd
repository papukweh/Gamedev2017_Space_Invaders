extends TextEdit

var delay = null
var saved = false
var new_Score = [" ", " "]

func _ready():
	delay = Timer.new()
	delay.set_wait_time(3)
	delay.set_one_shot(true)
	delay.connect("timeout", self, "_now")
	add_child(delay)
	delay.start()
	
func _now():
	set_fixed_process(true)

func _fixed_process(delta):
	if(Input.is_action_pressed("ui_accept") and not(saved)):
		delay = Timer.new()
		delay.set_wait_time(1)
		delay.set_one_shot(true)
		delay.connect("timeout", self, "_ok")
		add_child(delay)
		delay.start()
		saved = true

func _ok():
	print("Name: "+self.get_text()+"Score: "+str(floor(global.POINTS)))
	var all_Scores = global.read_save()
	new_Score[0] = self.get_text()
	new_Score[1] = str(floor(global.POINTS))
	all_Scores.append(new_Score)
	all_Scores.sort()
	global.save(all_Scores)
	global.SCORES = all_Scores
	get_tree().change_scene("res://Main menu.tscn")