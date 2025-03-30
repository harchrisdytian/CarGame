extends MultiplayerSynchronizer

var input_direction : Vector2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if get_multiplayer_authority() != multiplayer.get_unique_id():
		set_process(false)
		set_physics_process(false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	input_direction.x = Input.get_axis("Left","Right")
	input_direction.y = Input.get_axis("Up","Down")
