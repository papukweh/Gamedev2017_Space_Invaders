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
	if not dead and body extends preload("res://Enemy.gd"):
		print("Enemy hit!")
		body.queue_free()
		global.POINTS = global.POINTS + 50
		dead = true