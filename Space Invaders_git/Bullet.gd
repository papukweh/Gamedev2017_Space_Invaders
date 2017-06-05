extends KinematicBody2D

const SPEED_FACTOR = 1024
export(int) var speed = 1

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	move(Vector2(0,-1) * speed * SPEED_FACTOR * delta)