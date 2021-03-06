extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export (int) var speed = 1200

func _ready():
	get_child(3).play("ufo_lowpitch")
	set_fixed_process(true)
	
func _fixed_process(delta):
	if self.get_pos().x >=750:
		self.queue_free()
	move(Vector2(1,0)*speed*delta)