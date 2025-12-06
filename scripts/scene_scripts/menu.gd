extends Control

@onready var slot_1: Panel = $LoadPanel/ScrollContainer/VBoxContainer/Slot1

func _ready() -> void:
    if OS.get_name() == "HTML5":
        $Buttons/Quit.visible = false
    if GameManager.does_save_exist():
        $Buttons/LoadGame.disabled = false        
        # load saves, then add them to the load game panel
        var saves: Array[int] = GameManager.get_all_save_slots()
        if saves.is_empty():
            $Buttons/LoadGame.disabled = true
            
        for save in saves:
            var save_panel: Panel
            var slot_label: Label
            var load_button: Button
            if save == 1:
                save_panel = $LoadPanel/ScrollContainer/VBoxContainer.get_node("Slot1")
            else:
                save_panel = $LoadPanel/ScrollContainer/VBoxContainer.get_node("Slot1").duplicate()
                $LoadPanel/ScrollContainer/VBoxContainer.add_child(save_panel)
                save_panel.name = "Slot" + str(save)
                
            slot_label = save_panel.get_child(0).get_child(0)
            load_button = save_panel.get_child(0).get_child(1)
            slot_label.text = "Save Slot " + str(save)
            load_button.pressed.connect(func():
                GameManager.current_slot = save
                GameManager.load_game()
                get_tree().change_scene_to_file("res://scenes/game.tscn")
            )
        
func _on_new_game_pressed() -> void:
    get_tree().change_scene_to_file("res://scenes/game_starter.tscn")

func _on_load_game_pressed() -> void:
    $LoadPanel.visible = true
    $Buttons/LoadGame.release_focus()

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


func _on_exit_load_pressed() -> void:
    $LoadPanel.visible = false
