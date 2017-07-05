extends Node
var delay = null
var current_scene = null
var music = null
var menu = null
var sound = null
var library = SampleLibrary.new()

func _ready():
	var player_hit = load("res://Assets/Explosion5.smp")
	var enemy_hit = load("res://Assets/invaderkilled.smp")
	var death = load("res://Assets/Explosion6.smp")
	var begin = load("res://Assets/Menu1B.smp")
	library.add_sample("begin", begin)
	library.add_sample("player_hit", player_hit)
	library.add_sample("enemy_hit", enemy_hit)
	library.add_sample("death", death)
	menu = load("res://Assets/buildy.ogg")
	if current_scene == "Map" or current_scene== "Game_Over":
		music.stop()
	else:
		sound = SamplePlayer.new()
		sound.set_default_volume_db(-12.5)
		music = StreamPlayer.new()
		add_child(music)
		add_child(sound)
		sound.set_sample_library(library)
		sound.set_polyphony(5)
		music.set_stream(menu)
		music.set_loop(true)
		music.play()
	set_fixed_process(true)
	
func _fixed_process(delta):
		if HIT == true:
			sound.play("player_hit")
			HIT = false
		if LIVES <= 0 and current_scene != "Game_Over":
			sound.play("death")
		if EHIT == true:
			sound.play("enemy_hit")
			EHIT = false
		if current_scene == "Map" or current_scene== "Game_Over":
			music.stop()
		if current_scene == "Game_Over":
			delay = Timer.new()
			delay.set_wait_time(1)
			delay.set_one_shot(true)
			delay.connect("timeout", self, "ok")
			add_child(delay)
			delay.start()
		else:
			if not(music.is_playing()) and current_scene == "Menu":
				music.play()
				
func ok():
	sound.stop_all()

var HIT = false
var EHIT = false
var LIVES = 5
var POINTS = 0
var ENEMIES = 66
var DIR = false #false = right, true = left
var FLAG = false
var OK = 0
var TIME = 0
var LOSS
var PLAY = false
