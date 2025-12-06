extends Control

@onready var main_game_text: RichTextLabel = $MainDisplay/ScrollContainer/VBoxContainer/MainGameText

func _ready() -> void:
    if GameManager.save_data["slot_" + str(GameManager.current_slot)]["gameplay_data"].is_empty():
        # just started a new game
        pass
        
## use await before func to wait for text to finish.
func display_game_text(text: String, text_speed: float = 1) -> void:
    main_game_text.text = text
    main_game_text.visible_ratio = 0
    var tween: Tween = create_tween()
    tween.tween_property(main_game_text, "visible_ratio", 1, text_speed)
    await tween.finished
