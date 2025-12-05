extends Control

func _ready() -> void:
    if OS.get_name() == "HTML5":
        $Buttons/Quit.visible = false
    for i in range(4):
        if GameManager.does_save_exist_at_slot(i + 1):
            $Buttons/LoadGame.disabled = false
            break
func _on_new_game_pressed() -> void:
    get_tree().change_scene_to_file("res://scenes/game_starter.tscn")


func _on_load_game_pressed() -> void:
    pass # Replace with function body.


func _on_settings_pressed() -> void:
    pass # Replace with function body.


func _on_mods_pressed() -> void:
    pass # Replace with function body.


func _on_help_pressed() -> void:
    pass # Replace with function body.


func _on_extras_pressed() -> void:
    pass # Replace with function body.


func _on_quit_pressed() -> void:
    GameManager.save_game()
    get_tree().quit()
