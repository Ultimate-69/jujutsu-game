extends Control

@onready var heavenly_restriction_options: OptionButton = $CharacterCreator/ScrollContainer/VBoxContainer/Section/ScrollContainer/VBoxContainer/ChoicePair3/HeavenlyRestriction
@onready var cursed_technique: OptionButton = $CharacterCreator/ScrollContainer/VBoxContainer/Section/ScrollContainer/VBoxContainer/ChoicePair4/CursedTechnique
@onready var cursed_energy: Panel = $CharacterCreator/ScrollContainer/VBoxContainer/Section2/ScrollContainer/VBoxContainer/HBoxContainer/CursedEnergy
@onready var cursed_energy_value: Label = $CharacterCreator/ScrollContainer/VBoxContainer/Section2/ScrollContainer/VBoxContainer/HBoxContainer/CursedEnergy/VBoxContainer/HBoxContainer/Value
@onready var attributes_container: HBoxContainer = $CharacterCreator/ScrollContainer/VBoxContainer/Section2/ScrollContainer/VBoxContainer/HBoxContainer
@onready var points_remaining_label: Label = $CharacterCreator/ScrollContainer/VBoxContainer/Section2/ScrollContainer/VBoxContainer/PointsRemaining

var creation_stat_points: int = 15:
    set(value):
        creation_stat_points = value
        points_remaining_label.text = "Points Remaining: " + str(value)
var creation_stats = [0, 0, 0, 0, 0]

func _ready() -> void:
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
