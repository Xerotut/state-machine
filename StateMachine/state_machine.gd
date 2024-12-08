extends Resource
class_name StateMachine

@export var _starting_state: State

var _current_state: State
var _char_components: CharacterComponents

func setup_state_machine(char_components: CharacterComponents, starting_state: State = null)-> void:
	_char_components = char_components
	if starting_state:
		_starting_state = starting_state
	_change_state(_starting_state)


func state_process(delta: float) -> void:
	if _current_state:
		_current_state.process(delta)


func state_physics(delta: float) -> void:
	if _current_state:
		_current_state.process_physics(delta)


func _change_state(new_state: State) -> void:
	if _current_state:
		_current_state.exit_state()
	_current_state = new_state
	if !_current_state.transition_fired.is_connected(_change_state):
		_current_state.transition_fired.connect(_change_state)
	_current_state.enter_state(_char_components)
