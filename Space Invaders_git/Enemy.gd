extends KinematicBody2D

const BULLET =  preload("res://Enemy_bullet.tscn")
var delay = null

func _ready():
	delay = Timer.new()
	randomize()
	delay.set_wait_time(rand_range(0,5))
	delay.set_one_shot(true)
	delay.connect("timeout", self, "_on_timer_timeout")
	add_child(delay)
	delay.start()

func _on_timer_timeout():
		shoot()

func shoot():
		var bullet = BULLET.instance()
		bullet.set_pos(self.get_pos() + Vector2(0,20))
		get_parent().add_child(bullet)
		randomize()
		delay.set_wait_time(rand_range(0.2,2))
		delay.start()
