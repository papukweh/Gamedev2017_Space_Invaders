extends KinematicBody2D

const BULLET = preload("res://Bullet.tscn")

export(int) var SPEED

var velocity = Vector2()
var delay = null
var can_shoot = true
var position = Vector2(368, 500)

func _fixed_process(delta):
	var position = self.get_pos()
	if(global.LIVES <= 0):
		global.LOSS = true
		velocity.x = 0
		velocity.y = 0
		get_child(2).play("Explosion5_1")
		get_tree().change_scene("res://Game_Over.tscn")
	
	elif(Input.is_action_pressed("ui_select")):
		shoot()
	elif (Input.is_action_pressed("ui_left") && position.x > 20):
		velocity.x = -SPEED
		velocity.y = 0
	elif (Input.is_action_pressed("ui_right") && position.x < 730):
		velocity.x =  SPEED
		velocity.y = 0

	else:
		velocity.x = 0
		velocity.y = 0

	var motion = velocity * delta
	move(motion)
	
func _ready():
	set_fixed_process(true)
	delay = Timer.new()
	delay.set_wait_time(0.3)
	delay.set_one_shot(true)
	delay.connect("timeout", self, "_on_timer_timeout")
	add_child(delay)
	delay.start()

func _on_timer_timeout():
	can_shoot = true

func shoot():
	position = self.get_pos()
	if (Input.is_action_pressed("ui_left") && position.x > 20):
		velocity.x = -SPEED
		velocity.y = 0
	elif (Input.is_action_pressed("ui_right") && position.x < 730):
		velocity.x =  SPEED
		velocity.y = 0
	else:
		velocity.x = 0
		velocity.y = 0
	if(can_shoot):
		get_child(2).play("Laser_Shoot4")
		var bullet = BULLET.instance()
		bullet.set_pos(self.get_pos() + Vector2(0,-20))
		get_parent().add_child(bullet)
		can_shoot = false
		delay.start()