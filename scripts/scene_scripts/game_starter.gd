extends Control

@onready var heavenly_restriction_options: OptionButton = $CharacterCreator/ScrollContainer/VBoxContainer/Section/ScrollContainer/VBoxContainer/ChoicePair3/HeavenlyRestriction
@onready var cursed_technique: OptionButton = $CharacterCreator/ScrollContainer/VBoxContainer/Section/ScrollContainer/VBoxContainer/ChoicePair4/CursedTechnique
@onready var cursed_energy: Panel = $CharacterCreator/ScrollContainer/VBoxContainer/Section2/ScrollContainer/VBoxContainer/HBoxContainer/CursedEnergy
@onready var cursed_energy_value: Label = $CharacterCreator/ScrollContainer/VBoxContainer/Section2/ScrollContainer/VBoxContainer/HBoxContainer/CursedEnergy/VBoxContainer/HBoxContainer/Value
@onready var attributes_container: HBoxContainer = $CharacterCreator/ScrollContainer/VBoxContainer/Section2/ScrollContainer/VBoxContainer/HBoxContainer
@onready var points_remaining_label: Label = $CharacterCreator/ScrollContainer/VBoxContainer/Section2/ScrollContainer/VBoxContainer/PointsRemaining
@onready var scenarios_container: VBoxContainer = $ScenarioSelector/ScrollContainer/VBoxContainer

var chosen_scenario: String = ""
var creation_stat_points: int = 15:
    set(value):
        creation_stat_points = value
        points_remaining_label.text = "Points Remaining: " + str(value)
var creation_stats = [0, 0, 0, 0, 0]

var character_data = {
    "name": ""
}

func _ready() -> void:
    init()
        
func init() -> void:
    $ScenarioSelector.visible = true
    $CharacterCreator.visible = false
    
    var i: int = 0
    for attribute: Panel in attributes_container.get_children():
        var container: HBoxContainer = attribute.get_child(0).get_child(1)
        var remove_button: Button = container.get_child(0)
        var value: Label = container.get_child(1)
        var add_button: Button = container.get_child(2)
        remove_button.pressed.connect(func():
            if creation_stats[i] > 0 :
                creation_stats[i] -= 1
                creation_stat_points += 1
                value.text = str(creation_stats[i])
        )
        add_button.pressed.connect(func():
            if creation_stats[i] < 30 and creation_stat_points > 0:
                creation_stats[i] += 1
                creation_stat_points -= 1
                value.text = str(creation_stats[i])
        )
        i += 1
    for scenario: Panel in scenarios_container.get_children():
        var choose: Button = scenario.get_child(2)
        var scenario_name: String = scenario.get_child(0).text
        choose.pressed.connect(func():
            chosen_scenario = scenario_name
            $ScenarioSelector/HBoxContainer/ContinueToCharacterCreation.disabled = false
        )

func _on_heavenly_restriction_item_selected(index: int) -> void:
    if index == 1:
        cursed_technique.disabled = true
        cursed_technique.selected = 0
        cursed_energy.visible = false
        if creation_stats[4] > 0:
            creation_stat_points += creation_stats[4]
            creation_stats[4] = 0
            cursed_energy_value.text = "0"
        cursed_technique.focus_mode = Control.FOCUS_NONE
    else:
        cursed_technique.disabled = false
        cursed_energy.visible = true
        cursed_technique.focus_mode = Control.FOCUS_ALL


func _on_back_pressed() -> void:
    $CharacterCreator.visible = false
    $ScenarioSelector.visible = true


func _on_back_to_menu_pressed() -> void:
    get_tree().change_scene_to_file("res://scenes/menu.tscn")


func _on_continue_to_character_creation_pressed() -> void:
    $ScenarioSelector.visible = false
    $CharacterCreator.visible = true


func _on_name_text_changed(new_text: String) -> void:
    character_data["name"] = new_text
    if new_text == "":
        $CharacterCreator/ScrollContainer/VBoxContainer/Section3/HBoxContainer/Start.disabled = true
    else:
        $CharacterCreator/ScrollContainer/VBoxContainer/Section3/HBoxContainer/Start.disabled = false

func _on_start_pressed() -> void:
    if GameManager.does_save_exist_at_slot(GameManager.current_slot):
        GameManager.current_slot += 1
    GameManager.save_data = {
        "slot_" + str(GameManager.current_slot): {
            "name": character_data["name"],
            "technique": cursed_technique.get_item_text(cursed_technique.selected).to_lower(),
            "heavenly_restriction": heavenly_restriction_options.selected,
            "affiliation": "independent",
            "scenario": chosen_scenario.to_lower(),
            "stats": {
                "strength": creation_stats[0],
                "speed": creation_stats[1],
                "durability": creation_stats[2],
                "perception": creation_stats[3],
                "cursed_energy": creation_stats[4],
            },
            "gameplay_data": {
                
            }
        }
    }
    GameManager.save_game()
    get_tree().change_scene_to_file("res://scenes/game.tscn")
