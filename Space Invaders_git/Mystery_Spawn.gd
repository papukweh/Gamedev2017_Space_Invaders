extends Node2D

const SHIP = preload("res://Mystery.tscn")
var delay = null

func _ready():
	delay = Timer.new()
	randomize()
	delay.set_wait_time(rand_range(15,50))
	delay.set_one_shot(true)
	delay.connect("timeout", self, "_spawn")
	add_child(delay)
	delay.start()

func _spawn():
	var ship = SHIP.instance()
	ship.set_pos(self.get_pos())
	get_parent().add_child(ship)