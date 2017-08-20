extends Control
var delay = null

func _ready():
	global.current_scene = "Menu"
	global.LIVES = 5
	global.POINTS = 0
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
		global.sound.play("begin")
		wait()
	elif(Input.is_action_pressed("credits")):
			get_tree().change_scene("res://Credits.tscn")
	elif(Input.is_action_pressed("score")):
			get_tree().change_scene("res://High_Scores.tscn")

func wait():
	delay = Timer.new()
	delay.set_wait_time(0.3)
	delay.set_one_shot(true)
	delay.connect("timeout", self, "stop")
	add_child(delay)
	get_child(7).play("flash",1,1,false)
	delay.start()

func stop():
	global.sound.stop_all()
	delay = Timer.new()
	delay.set_wait_time(1.6)
	delay.set_one_shot(true)
	delay.connect("timeout", self, "change")
	add_child(delay)
	delay.start()

func change():
	get_tree().change_scene("res://Map.tscn")