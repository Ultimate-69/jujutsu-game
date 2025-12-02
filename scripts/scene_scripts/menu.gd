extends Control

func _ready() -> void:
    if OS.get_name() == "HTML5":
        $Buttons/Quit.visible = false

func _on_new_game_pressed() -> void:
    pass # Replace with function body.


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
