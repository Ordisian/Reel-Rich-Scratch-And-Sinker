# catalogue_dropdown.gd
extends VBoxContainer
class_name CatalogueDropdown

@export var catalogue: BaitCatalogue

const HOVER_COLOR: Color = Color(1, 1, 1, 0.06)
const ANIM_DURATION: float = 0.22
const COLUMN_COUNT: int = 4

@onready var header_button: Button = $HeaderButton
@onready var content_clip: MarginContainer = $ContentClip
@onready var rows_root: Control = $ContentClip/RowsRoot
@onready var item_list: GridContainer = $ContentClip/RowsRoot/ItemList
@onready var hover_layer: Control = $ContentClip/RowsRoot/HoverLayer

var _row_hover_panels: Array[Panel] = []
var _is_open: bool = false
var _tween: Tween

func _ready() -> void:
	# item_list.columns = COLUMN_COUNT  <- remove, no longer a GridContainer
	header_button.toggle_mode = true
	header_button.toggled.connect(_on_toggled)
	content_clip.clip_contents = true
	content_clip.custom_minimum_size.y = 0.0

	if catalogue:
		header_button.text = catalogue.display_name
		_apply_catalogue_color()
		_populate_items()

func _apply_catalogue_color() -> void:
	var style := StyleBoxFlat.new()
	style.bg_color = catalogue.border_color
	header_button.add_theme_stylebox_override("normal", style)

func _populate_items() -> void:
	for bait in catalogue.bait_items:
		_build_bait_row(bait)

func _build_bait_row(bait: BaitData) -> void:
	var row := Button.new()
	row.flat = false
	row.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	row.custom_minimum_size.y = 60
	row.pressed.connect(_on_buy_pressed.bind(bait))

	var row_vbox := VBoxContainer.new()
	row_vbox.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	row_vbox.mouse_filter = Control.MOUSE_FILTER_IGNORE
	row.add_child(row_vbox)

	# Top line: "BUY: Name" on the left, cost on the right
	var top_line := HBoxContainer.new()
	top_line.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	top_line.mouse_filter = Control.MOUSE_FILTER_IGNORE
	row_vbox.add_child(top_line)

	var name_label := Label.new()
	name_label.text = "  BUY: %s" % bait.display_name
	name_label.clip_text = true
	name_label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	name_label.mouse_filter = Control.MOUSE_FILTER_IGNORE
	top_line.add_child(name_label)

	var cost_label := Label.new()
	cost_label.text = "%d g" % bait.cost
	cost_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	cost_label.mouse_filter = Control.MOUSE_FILTER_IGNORE
	cost_label.size_flags_horizontal = Control.SIZE_SHRINK_END
	top_line.add_child(cost_label)

	# Bottom line: level + xp bar
	var bottom_line := HBoxContainer.new()
	bottom_line.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	bottom_line.mouse_filter = Control.MOUSE_FILTER_IGNORE
	row_vbox.add_child(bottom_line)

	var level_label := Label.new()
	level_label.text = "  Lv %d/%d" % [bait.level, bait.max_level]
	level_label.custom_minimum_size.x = 50
	level_label.mouse_filter = Control.MOUSE_FILTER_IGNORE
	bottom_line.add_child(level_label)

	var xp_bar := ProgressBar.new()
	xp_bar.max_value = bait.xp_to_next
	xp_bar.value = bait.xp
	xp_bar.custom_minimum_size = Vector2(315, 16)
	xp_bar.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	xp_bar.modulate = catalogue.border_color
	xp_bar.show_percentage = false
	xp_bar.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	xp_bar.mouse_filter = Control.MOUSE_FILTER_IGNORE
	bottom_line.add_child(xp_bar)

	item_list.add_child(row)

func _wire_row_hover(row: PanelContainer, hover_style: StyleBox, empty_style: StyleBox) -> void:
	row.mouse_entered.connect(func(): row.add_theme_stylebox_override("panel", hover_style))
	row.mouse_exited.connect(func(): row.add_theme_stylebox_override("panel", empty_style))

func _build_hover_panels() -> void:
	var row_count: int = item_list.get_child_count() / COLUMN_COUNT
	var style_hover := StyleBoxFlat.new()
	style_hover.bg_color = HOVER_COLOR

	for row in row_count:
		var first_cell: Control = item_list.get_child(row * COLUMN_COUNT)
		var last_cell: Control = item_list.get_child(row * COLUMN_COUNT + COLUMN_COUNT - 1)

		var row_rect := Rect2(
			Vector2(first_cell.position.x, first_cell.position.y),
			Vector2(last_cell.position.x + last_cell.size.x - first_cell.position.x, first_cell.size.y)
		)

		var hover_panel := Panel.new()
		hover_panel.add_theme_stylebox_override("panel", style_hover)
		hover_panel.position = row_rect.position
		hover_panel.size = row_rect.size
		hover_panel.visible = false
		hover_panel.mouse_filter = Control.MOUSE_FILTER_IGNORE
		hover_layer.add_child(hover_panel)
		_row_hover_panels.append(hover_panel)

		var row_idx := row
		for col in COLUMN_COUNT:
			var cell: Control = item_list.get_child(row * COLUMN_COUNT + col)
			cell.mouse_entered.connect(_on_row_hover.bind(row_idx, true))
			cell.mouse_exited.connect(_on_row_hover.bind(row_idx, false))

func _on_row_hover(row_idx: int, hovering: bool) -> void:
	_row_hover_panels[row_idx].visible = hovering

func _on_buy_pressed(bait: BaitData) -> void:
	print("Buy pressed: ", bait.display_name)
	# Hook to BaitBucket.spawn_bait(bait) once the bucket scene exists

func _on_toggled(pressed: bool) -> void:
	_is_open = pressed
	_animate_open(_is_open)

func _animate_open(open: bool) -> void:
	if _tween:
		_tween.kill()

	item_list.reset_size()
	var target_height: float = item_list.get_combined_minimum_size().y if open else 0.0

	_tween = create_tween()
	_tween.set_trans(Tween.TRANS_QUAD)
	_tween.set_ease(Tween.EASE_OUT)
	_tween.tween_property(content_clip, "custom_minimum_size:y", target_height, ANIM_DURATION)
