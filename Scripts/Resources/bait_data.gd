# bait_data.gd
extends Resource
class_name BaitData

@export var id: StringName
@export var display_name: String = "Worm"
@export var icon: Texture2D

@export_group("ToolTip")
@export var catch_type: String = "Sardine"
@export var tool_tip: String = "Its Squirmy..."

@export_group("Progression")
@export var level: int = 1
@export var max_level: int = 10
@export var xp: float = 0.0
@export var xp_to_next: float = 100.0

@export_group("Economy")
@export var cost: int = 10

@export_group("Catch Stats")
@export var catch_power: float = 1.0  # ring size
