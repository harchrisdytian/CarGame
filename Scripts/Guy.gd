extends CharacterBody2D


const SPEED = 3000.0
const JUMP_VELOCITY = -400.0

@export var id := 1:
	set(player_id):	
		id = player_id
		%InputSynchronizer.set_multiplayer_authority(player_id)

func _physics_process(_delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if(multiplayer.is_server()):
		velocity = %InputSynchronizer.input_direction
		velocity *= SPEED
		move_and_slide()
