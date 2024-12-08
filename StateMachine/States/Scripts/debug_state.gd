extends State
class_name DebugState


@export var text_to_print: String = ""


func process(delta: float) -> void:
	if text_to_print == "":
		print(self.get_instance_id())
	else:
		print(text_to_print)
	_check_transitions()
