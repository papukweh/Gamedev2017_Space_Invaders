extends Label
var points = 0
var counter_f = "POINTS %s"

func _ready():
	self.set_text(counter_f % [points])
	set_fixed_process(true)
	
func _fixed_process(delta):
	points = global.POINTS
	self.set_text(counter_f % [points])