extends AnimationPlayer
var delay = null

func _ready():
	delay = Timer.new()
	delay.set_wait_time(3)
	delay.set_one_shot(true)
	delay.connect("timeout", self, "ok")
	add_child(delay)
	delay.start()
	
func ok():
	self.get_parent().get_child(4).play("Flashing_text",1,1,false)
