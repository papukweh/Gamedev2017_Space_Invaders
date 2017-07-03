extends Label
var points = 0
var counter_f = "YOUR SCORE: %s"

func _ready():
	points = global.POINTS
	self.set_text(counter_f % [points])