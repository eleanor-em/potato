class_name Controller extends Node2D

var animated_sprite: AnimatedSprite2D
var state: State
var state_factory: StateFactory

var ground_position = self.position
var height: float = 0.0
var velocity = Vector2.ZERO
var z_velocity: float = 0.0

const friction: float = 1.4
const jump_velocity: float = 400
const shadow_offset = Vector2(0, 54)
const shadow_radius: float = 20
const gravity: float = 1500

func _ready():
	animated_sprite = $AnimatedSprite2D
	state_factory = StateFactory.new()
	change_state(State.Type.Idle)

func _process(_delta: float):
	if Input.is_action_pressed("move_left"):
		state.action_move_left()
	if Input.is_action_pressed("move_right"):
		state.action_move_right()
	if Input.is_action_pressed("move_up"):
		state.action_move_up()
	if Input.is_action_pressed("move_down"):
		state.action_move_down()
	if Input.is_action_just_pressed("jump"):
		state.action_jump()

func _physics_process(delta: float):
	state.update_position(delta)
	ground_position += velocity * delta
	position = ground_position - height * Vector2.UP

	state.update_velocity(delta)
	# NOTE: target delta is 1/60. Delay-corrected version of:
	# `velocity /= friction`
	velocity = velocity.lerp(velocity / friction, delta*60)

func _draw():
	draw_circle(shadow_offset + height * Vector2.UP,
				shadow_radius,
				Color(Color.BLACK, 0.4))

func change_state(new_state: State.Type):
	if state != null:
		state.queue_free()
	state = state_factory.get_state(new_state).new()
	state.setup(self, animated_sprite)
	state.name = "current_state"
	add_child(state)
