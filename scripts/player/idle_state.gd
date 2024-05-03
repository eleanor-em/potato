class_name IdleState extends State

func _ready():
	animated_sprite.stop()

func _flip_direction():
	animated_sprite.flip_h = not animated_sprite.flip_h

func action_move_left():
	if animated_sprite.flip_h:
		controller.change_state(State.Type.Run)
	else:
		_flip_direction()

func action_move_right():
	if not animated_sprite.flip_h:
		controller.change_state(State.Type.Run)
	else:
		_flip_direction()

func action_move_up():
	controller.change_state(State.Type.Run)

func action_move_down():
	controller.change_state(State.Type.Run)

func action_jump():
	# TODO: perhaps add some sort of tag system to the State,
	# so impl. of action_jump() can be shared in all states that are
	# tagged action_jumpable
	controller.change_state(Type.Fall)
	controller.z_velocity = -controller.jump_velocity
