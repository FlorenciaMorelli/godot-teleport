extends ColorRect


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"../../FinalDoor".change_scene.connect(fade_in)

func change_level():
	get_tree().change_scene_to_file("res://levels/scenes/level_2.tscn")


func fade_in():
	$"../AnimationPlayer".play("fade_in")

func fade_out():
	$"../AnimationPlayer".play("fade_out")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
