extends Node

## Main.gd
## Orchestrates the sequence: Cast (RodPanel) -> Reel (ReelMinigame) ->
## Scratch (ScratchPanel) -> back to idle. Each step is its own panel/
## script; this just wires the hand-offs between them.

#@onready var rod_panel = $VBoxContainer/MidArea/CenterColumn/RodPanel
#@onready var reel_minigame = $VBoxContainer/MidArea/CenterColumn/ReelMinigame
#@onready var scratch_panel = $VBoxContainer/MidArea/CenterColumn/ScratchPanel

#func _ready() -> void:
	#rod_panel.cast_requested.connect(_on_cast_requested)
	#reel_minigame.reel_finished.connect(_on_reel_finished)
	#GameState.fish_ready_to_scratch.connect(_on_fish_ready_to_scratch)
	#scratch_panel.scratch_finished.connect(_on_scratch_finished)

#func _on_cast_requested() -> void:
	#reel_minigame.start_reel()
#
#func _on_reel_finished(bonus_multiplier: float) -> void:
	#GameState.resolve_reel(bonus_multiplier)
#
#func _on_fish_ready_to_scratch(fish_data: Dictionary) -> void:
	#scratch_panel.setup_fish(fish_data)
#
#func _on_scratch_finished() -> void:
	#pass  # idle state - rod panel already refreshed itself via bait_unloaded
