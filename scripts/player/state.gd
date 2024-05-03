class_name State extends Node

enum Type {
	Idle,
	Run,
	Fall,
}

var Idle = Type.Idle
var Run = Type.Run

var controller: Controller
var animated_sprite: AnimatedSprite2D

func setup(controller_, animated_sprite_):
	controller = controller_
	animated_sprite = animated_sprite_

func action_move_left():
	pass

func action_move_right():
	pass

func action_move_up():
	pass

func action_move_down():
	pass

func action_jump():
	pass

func update_position(_delta):
	pass

func update_velocity(_delta):
	pass

func change_to_idle():
	print("change to idle")
	controller.change_state(Type.Idle)
	# Animation should stop on frame 0.
	if animated_sprite.frame == 0:
		animated_sprite.stop()
