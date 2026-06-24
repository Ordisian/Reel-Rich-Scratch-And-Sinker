extends Control

## drag_handle.gd

const MIN_WIDTH: float = 0.0
const MAX_WIDTH: float = 900.0

@export var resize_direction: int = 1
@export var target_panel: NodePath

var is_dragging : bool = false
var panel: Control

func _ready() -> void:
	panel = get_node(target_panel)
	mouse_default_cursor_shape = Control.CURSOR_HSIZE
	set_process_unhandled_input(false) # we'll use _input instead

func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		is_dragging = event.pressed
		get_viewport().set_input_as_handled()

func _input(event: InputEvent) -> void:
	if is_dragging and event is InputEventMouseMotion:
		_apply_resize(event.relative.x)

func _apply_resize(delta_x: float) -> void:
	var new_width: float = panel.custom_minimum_size.x + (delta_x * resize_direction)
	new_width = clamp(new_width, MIN_WIDTH, MAX_WIDTH)
	panel.custom_minimum_size.x = new_width
