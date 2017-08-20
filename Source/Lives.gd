extends Label
var lives = 5
var counter_f = "LIVES: %s"

func _ready():
	self.set_text(counter_f % [lives])
	set_fixed_process(true)	
	
func _fixed_process(delta):
	lives = global.LIVES
	self.set_text(counter_f % [lives])