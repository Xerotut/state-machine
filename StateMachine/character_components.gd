extends Resource
class_name CharacterComponents

var char_body: CharacterBody2D:
	set(value):
		push_error("This can't be changed")

var char_sprite: Sprite2D:
	set(value):
		push_error("This can't be changed")
		
var char_collision_shape: CollisionShape2D:
	set(value):
		push_error("This can't be changed")
		

func _init(body: CharacterBody2D, sprite: Sprite2D, collision_shape: CollisionShape2D) -> void:
	char_body = body
	char_sprite = sprite
	char_collision_shape = collision_shape
