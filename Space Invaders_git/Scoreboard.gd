extends TextEdit

var delay = null

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	if(Input.is_action_pressed("ui_accept")):
		delay = Timer.new()
		delay.set_wait_time(1)
		delay.set_one_shot(true)
		delay.connect("timeout", self, "_ok")
		add_child(delay)
		delay.start()
func _ok():
	print("Name: "+self.get_text()+"Score: "+str(global.POINTS))
	get_tree().change_scene("res://Main menu.tscn")