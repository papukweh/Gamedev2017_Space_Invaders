extends KinematicBody2D

var SPEED = 250
const BULLET = preload("res://Bullet.tscn")

var velocity = Vector2()

func _fixed_process(delta):
	
	if (Input.is_action_pressed("ui_left")):
		velocity.x = -SPEED
	elif (Input.is_action_pressed("ui_right")):
		velocity.x =  SPEED
	elif(Input.is_action_pressed("ui_up")):
		velocity.y = -SPEED
	elif(Input.is_action_pressed("ui_down")):
		velocity.y = SPEED
	else:
		velocity.x = 0
		velocity.y = 0

	var motion = velocity * delta
	move(motion)

func _ready():
    set_fixed_process(true)

func shoot():
	if(Input.is_action_pressed("ui_accept")):
		var bullet = BULLET.instance()
		bullet.set_pos(self.get_pos() + Vector2(0,-20))
		get_parent().add_child(bullet)
	

func _on_Timer_timeout():
	shoot()
