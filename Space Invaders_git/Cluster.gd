extends KinematicBody2D

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	if global.OK == global.ENEMIES:
		global.FLAG = false
		global.OK = 0
	var speed = 100/(1.5*global.ENEMIES)
	if self.get_pos().x >=450 or self.get_pos().x<=290:
		global.FLAG=true
		self.set_pos(Vector2(self.get_pos().x, self.get_pos().y+32))
		if global.DIR==false:
			global.DIR = true
		else:
			global.DIR = false
	if global.DIR==false:
		move(Vector2(1,0)*speed*delta)
	else:
		move(Vector2(-1,0)*speed*delta)
