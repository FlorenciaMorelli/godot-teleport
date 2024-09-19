extends Area2D

@export var doorID = 1
var offset = Vector2(100, 0)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D :
		if doorID == 1 :
			var topDoor = get_parent().get_node("TopDoor")
			body.position = topDoor.position + offset
		elif doorID == 2 :
			var bottomDoor = get_parent().get_node("BottomDoor")
			body.position = bottomDoor.position - offset
			
