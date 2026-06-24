extends Resource
# bait_catalogue.gd
class_name BaitCatalogue

@export var id: StringName
@export var display_name: String = "Starter"
@export var background_color: Color = Color.html("a87850")  # amber default per catalogue
@export var border_color: Color = Color.html("a87850")  # amber default per catalogue

@export_group("Progression")
@export var prestige_required_to_unlock: int = 0 # Start

@export_group("Contents")
@export var bait_items: Array[BaitData] = []
