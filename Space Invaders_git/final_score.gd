extends Label
var points = 0
var counter_f = "YOUR SCORE: %s"

func _ready():
	if global.LIVES > 0:
		global.LOSS = false
		var bonus = 0.0+global.LIVES
		points = floor(global.POINTS + 10000*(bonus/global.TIME))
		global.POINTS = points
	else:
		points = global.POINTS
	self.set_text(counter_f % [points])