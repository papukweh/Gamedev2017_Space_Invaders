extends TextEdit

var delay = null

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
	if(Input.is_action_pressed("ui_accept")):
		print("Name: "+self.get_text()+"Score: "+str(floor(global.POINTS)))
		delay = Timer.new()
		delay.set_wait_time(1)
		delay.set_one_shot(true)
		delay.connect("timeout", self, "_ok")
		add_child(delay)
		delay.start()
func _ok():
	get_tree().change_scene("res://Main menu.tscn")