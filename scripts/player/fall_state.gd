class_name FallState extends State

var holding_jump: bool
var drift = Vector2.ZERO
@export var drift_speed = Vector2(45, 50)
@export var extra_jump_velocity = 800

func _ready():
	holding_jump = Input.is_action_pressed("jump")
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
	controller.queue_redraw()

func update_velocity(delta):
	holding_jump = holding_jump && Input.is_action_pressed("jump")
	if holding_jump and controller.z_velocity < 0:
		controller.z_velocity -= extra_jump_velocity * delta
	controller.z_velocity += controller.gravity * delta
