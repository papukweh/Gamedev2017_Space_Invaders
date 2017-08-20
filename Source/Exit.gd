extends ConfirmationDialog

func _ready():
	self.popup()
	set_fixed_process(true)

func _fixed_process(delta):
	if self.get_ok().is_pressed():
		self.get_tree().quit()