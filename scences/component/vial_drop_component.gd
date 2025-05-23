extends Node

@export_range(0,1) var drop_percent: float = 0.5
@export var health_compent: Node
@export var vial_scene: PackedScene

func _ready():
	(health_compent as HealthComponent).died.connect(on_died)

func on_died():
	if randf() > drop_percent:
		return
	if vial_scene == null:
		return
	if not owner is Node2D:
		return
	var spawn_posisition = (owner as Node2D).global_position
	var vial_instance = vial_scene.instantiate() as Node2D
	var entites_layer = get_tree().get_first_node_in_group("entities_layer")
	entites_layer.add_child(vial_instance)
	vial_instance.global_position = spawn_posisition
