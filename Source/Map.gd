extends YSort
var delay = null

func _ready():
	global.PLAY = false
	global.current_scene = "Map"
	global.TIME = 0
	global.LIVES = 5
	global.ENEMIES = 66
	global.LOSS = false
	get_node("Cluster").set_pos(Vector2(375, 268))
	delay = Timer.new()
	delay.set_wait_time(1)
	delay.set_one_shot(false)
	delay.connect("timeout", self, "_on_timer_timeout")
	add_child(delay)
	delay.start()

func _on_timer_timeout():
	global.TIME = global.TIME +1