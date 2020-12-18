extends KinematicBody2D

onready var ray = $RayCast2D
var grid_size = 16
var inputs = {
	'ui_up': Vector2.UP,
	'ui_down': Vector2.DOWN,
	'ui_left': Vector2.LEFT,
	'ui_right': Vector2.RIGHT,
}

func _unhandled_input(event):
	for direction in inputs.keys():
		if event.is_action_pressed(direction):
			move(direction)
		if event.is_action_pressed('restart'):
			get_tree().reload_current_scene()

func move(direction):
	var vector_position = inputs[direction] * grid_size
	ray.cast_to = vector_position
	ray.force_raycast_update()
	if !ray.is_colliding():
		position += vector_position
		self.get_parent().moves += 1
	#check the collider is box or not
	else:
		var collider = ray.get_collider()
		if collider.is_in_group('box'):
			if collider.move(direction):
				position += vector_position
				self.get_parent().moves += 1

