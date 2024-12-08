extends State
class_name ERunState

@export var _speed: float

var e_body: CharacterBody2D


func setup_state(eman_components: CharacterComponents) -> void:
	_char_components = eman_components
	e_body = _char_components.eman_body


func process_physics(_delta: float) -> void:
	var direction: float = Input.get_axis("ui_left", "ui_right")
	if direction:
		e_body.velocity.x = direction * _speed
	else:
		e_body.velocity.x = move_toward(e_body.velocity.x, 0, _speed)

	e_body.move_and_slide()
	
	_check_physics_transitions()
