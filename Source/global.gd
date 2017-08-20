extends Node

var savegame = File.new() #file
var save_path = "user://savegame.save" #place of the file
var save_data = {"highscore": ["A", 0]} #variable to store data
const EXIT =  preload("res://Exit.tscn")

var delay = null
var current_scene = null
var music = null
var menu = null
var sound = null
var SCORES = read_save()
var library = SampleLibrary.new()
var animation = true

func save(high_score):    
   save_data["highscore"] = high_score #data to save
   savegame.open(save_path, File.WRITE) #open file to write
   savegame.store_var(save_data) #store the data
   savegame.close() # close the file

func read_save():
   savegame.open(save_path, File.READ) #open the file
   save_data = savegame.get_var() #get the value
   savegame.close() #close the file
   return save_data["highscore"] #return the value

func _ready():
	if not savegame.file_exists(save_path):
		create_save()
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
	
func create_save():
   savegame.open(save_path, File.WRITE)
   savegame.store_var(save_data)
   savegame.close()
	
func _fixed_process(delta):
	if(Input.is_action_pressed("ui_cancel")):
		var exit = EXIT.instance()
		get_parent().add_child(exit)
	else:
		if(Input.is_action_pressed("ui_accept") and current_scene=="High_Scores"):
			get_tree().change_scene("res://Main menu.tscn")
		if HIT == true:
			sound.play("player_hit")
			HIT = false
		if LIVES <= 0 and current_scene != "Game_Over":
			LOSS = true
			sound.play("death")
		if ENEMIES <= 0 and current_scene == "Map":
			LOSS = false
			get_tree().change_scene("res://Game_Over.tscn")
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
var PLAY = false
var LOSS = false
