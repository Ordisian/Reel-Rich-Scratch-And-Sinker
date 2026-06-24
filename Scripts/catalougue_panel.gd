# catalogue_panel.gd
extends VBoxContainer
class_name CataloguePanel

const CATALOGUE_DROPDOWN = preload("uid://mahlbfw2qx41")

@export var catalogues: Array[BaitCatalogue] = []
# ^ Fill Out Here In Inspector ^

func _ready() -> void:
	_build_catalogues()

func _build_catalogues() -> void:
	for catalogue in catalogues:
		var dropdown := CATALOGUE_DROPDOWN.instantiate() as CatalogueDropdown
		dropdown.catalogue = catalogue
		add_child(dropdown)
		# TODO: once PrestigeManager exists, check catalogue.prestige_required_to_unlock
		# and call dropdown.set_locked(...) accordingly. All catalogues unlocked for now.
