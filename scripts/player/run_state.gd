class_name RunState extends State

const move_speed = Vector2(45, 50)
const min_move_speed = 10

func _ready():
	# Begin animation immediately.
	animated_sprite.frame = 1
	animated_sprite.play()

func _physics_process(_delta):
	if controller.velocity.length() < min_move_speed:
		change_to_idle()

func action_move_left():
	if animated_sprite.flip_h:
		controller.velocity.x -= move_speed.x
	else:
		controller.velocity.x = 0
		change_to_idle()

func action_move_right():
	if not animated_sprite.flip_h:
		controller.velocity.x += move_speed.x
	else:
		controller.velocity.x = 0
		change_to_idle()

func action_move_up():
	if self.controller.velocity.y <= 0:
		self.controller.velocity.y -= self.move_speed.y
	else:
		self.controller.velocity.y = 0
		change_to_idle()

func action_move_down():
	if self.controller.velocity.y >= 0:
		self.controller.velocity.y += self.move_speed.y
	else:
		self.controller.velocity.y = 0
		change_to_idle()

func action_jump():
	controller.change_state(Type.Fall)
	controller.z_velocity = -controller.jump_velocity
