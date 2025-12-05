extends Control

func _ready() -> void:
    if GameManager.save_data["slot_" + str(GameManager.current_slot)]["gameplay_data"].is_empty():
        # just started a new game
        pass
