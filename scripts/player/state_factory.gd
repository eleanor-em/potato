class_name StateFactory

var states = {
	State.Type.Idle: IdleState,
	State.Type.Run: RunState,
	State.Type.Fall: FallState,
}

func get_state(state: State.Type):
	if states.has(state):
		return states.get(state)
	else:
		printerr("StateFactory: no such state: ", state)
