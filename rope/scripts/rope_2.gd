extends StaticBody2D

@export var segment_lenght: float = 20.0
@export var segment_count: int = 10 # N segments for the rope
@export var segment_scene: PackedScene # Precharged scene with elements

# Anchor points
@export var start_position: Vector2
@export var end_position: Vector2


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	create_rope(start_position)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func create_rope(start: Vector2) -> void:
	var previous_segment: RigidBody2D = null
	var current_position = start

	for i in range(segment_count):
		# New rope segment instance
		var segment = segment_scene.instantiate() as RigidBody2D
		segment.position = current_position
		add_child(segment)

		# Conectar el segmento al anterior con PinJoint2D
		if previous_segment:
			print ("Agrega segmento")
			var joint = PinJoint2D.new()
			joint.position = current_position
			joint.node_a = previous_segment.get_path()
			joint.node_b = segment.get_path()
			joint.bias =  1
			joint.softness = 0.05
			add_child(joint)
		else:
			var joint_to_static = PinJoint2D.new()
			joint_to_static.node_a = get_path()  # Nodo A: StaticBody2D
			joint_to_static.node_b = segment.get_path()  # Nodo B: Primer segmento
			joint_to_static.position = current_position  # Posición inicial del joint
			add_child(joint_to_static)

		# Actualizar la posición para el siguiente segmento
		current_position += Vector2(0, segment_length)
		previous_segment = segment

	# Fijar el último segmento en la posición final si es necesario
	if previous_segment and end_position != Vector2.ZERO:
		var joint = PinJoint2D.new()
		joint.position = end_position
		joint.node_a = previous_segment.get_path()
		joint.node_b = get_tree().current_scene.get_path()  # Anclarlo a la escena
		add_child(joint)
 
