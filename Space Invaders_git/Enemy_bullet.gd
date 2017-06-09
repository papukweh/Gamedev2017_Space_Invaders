extends KinematicBody2D
const SPEED_FACTOR = 1024
export(int) var speed = 1
export(float) var self_destruct_time = 2

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	move(Vector2(0,1) * speed * SPEED_FACTOR * delta)
	var time = Timer.new()
	time.set_wait_time(self_destruct_time)
	time.set_one_shot(true)
	self.add_child(time)
	time.start()
	if(time.get_time_left() == 0):
		queue_free()