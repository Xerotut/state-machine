extends Resource
class_name StateTrans

signal transition_approved(new_state: State)

@export var _state_to_transe: State

var _char_components: CharacterComponents
var _should_transition: bool


func setup_trans(char_components: CharacterComponents) -> void:
	if _char_components != char_components:
		_char_components = char_components


func check_trans() -> void:
	if _should_transition:
		transition_approved.emit(weakref(_state_to_transe))
