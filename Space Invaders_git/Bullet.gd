extends KinematicBody2D

const SPEED_FACTOR = 1024
export(int) var speed = 1
var dead = false

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	move(Vector2(0,-1) * speed * SPEED_FACTOR * delta)
	if(dead):
		self.queue_free()
	if(self.get_pos().y <= 0):
		dead = true

func _hit( body ):
	if not dead:
		if body extends preload("res://Enemy.gd"):
			global.POINTS = global.POINTS + 10
			global.ENEMIES = global.ENEMIES - 1
			body.queue_free()
		elif body extends preload("res://Enemy_2.gd"):
			global.POINTS = global.POINTS + 25
			global.ENEMIES = global.ENEMIES - 1
			body.queue_free()
		elif body extends preload("res://Enemy_3.gd"):
			global.POINTS = global.POINTS + 50
			global.ENEMIES = global.ENEMIES - 1
			body.queue_free()
		elif body extends preload("res://Enemy_4.gd"):
			global.POINTS = global.POINTS + 250
			body.queue_free()
		dead = true