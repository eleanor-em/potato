class_name FallState extends State

var drift = Vector2.ZERO
@export var drift_speed = Vector2(50, 55)

func _ready():
	animated_sprite.stop()

func action_move_left():
	controller.velocity.x -= drift_speed.x

func action_move_right():
	controller.velocity.x += drift_speed.x

func action_move_down():
	controller.velocity.y += drift_speed.y

func action_move_up():
	controller.velocity.y -= drift_speed.y

func update_position(delta):
	controller.height += controller.z_velocity * delta
	if controller.height > 0:
		controller.height = 0
		controller.z_velocity = 0
		change_to_idle()

func update_velocity(delta):
	controller.z_velocity += controller.gravity * delta
