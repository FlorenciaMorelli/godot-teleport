extends Area2D

signal change_scene


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#	Change level. Trucho
func _on_body_entered(body: Node2D) -> void:
	emit_signal("change_scene")
