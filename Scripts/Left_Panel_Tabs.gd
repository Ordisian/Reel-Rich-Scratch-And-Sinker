extends TabContainer

## Left_Panel_Tabs.gd

enum Tab { FISHING = 0, INVENTORY = 1 }

func _ready() -> void:
	tab_changed.connect(_on_tab_changed)
	current_tab = Tab.FISHING

func _on_tab_changed(tab: int) -> void:
	match tab:
		Tab.FISHING:
			print("Switched to Fishing tab")
		Tab.INVENTORY:
			print("Switched to Inventory tab")
