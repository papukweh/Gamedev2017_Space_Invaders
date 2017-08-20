extends TextureFrame
var delay = null

func _ready():
	delay = Timer.new()
	delay.set_wait_time(1)
	delay.set_one_shot(true)
	delay.connect("timeout", self, "ok")
	add_child(delay)
	delay.start()

func ok():
	set_fixed_process(true)

func _fixed_process(delta):
	if(Input.is_action_pressed("ui_accept")):
		get_tree().change_scene("res://Main menu.tscn")
	elif(Input.is_action_pressed("credits")):
		get_tree().change_scene("res://Main menu.tscn")
