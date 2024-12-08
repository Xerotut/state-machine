extends Resource
class_name State

signal transition_fired(new_state: State)

@export var _state_transes: Array[StateTrans]
@export var _state_physics_transes: Array[StateTrans]

var _char_components: CharacterComponents


func enter_state(char_components: CharacterComponents) -> void:
	if _char_components != char_components:
		_setup_state(char_components)


func process_physics(delta: float) -> void:
	_check_physics_transitions()
	

func process(delta: float) -> void:
	_check_transitions()


func exit_state() -> void:
	pass


func _check_physics_transitions():
	for trans in _state_physics_transes:
		trans.check_trans()


func _check_transitions():
	for trans in _state_transes:
		trans.check_trans()


func _setup_state(char_components: CharacterComponents) -> void:
	_char_components = char_components
	for trans in _state_transes:
		trans.setup_trans(char_components)
		if !trans.transition_approved.is_connected(_request_state_transition):
			trans.transition_approved.connect(_request_state_transition)


func _request_state_transition(new_state: State):
	transition_fired.emit(new_state)
