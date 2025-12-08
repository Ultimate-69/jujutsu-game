extends Control

@onready var main_game_text: RichTextLabel = $MainDisplay/ScrollContainer/VBoxContainer/MainGameText
@onready var choices_container: ScrollContainer = $MainDisplay/ScrollContainer/VBoxContainer/ChoicesContainer


func _ready() -> void:
    if GameManager.save_data["slot_" + str(GameManager.current_slot)]["gameplay_data"].is_empty():
        handle_intro()

func display_game_text(text_data: Dictionary) -> void:
    var text = text_data.get("text", "")
    var text_speed = text_data.get("speed", 1)
    var extra_delay = text_data.get("delay", false)
    
    
    main_game_text.text = text
    main_game_text.visible_ratio = 0
    var tween: Tween = create_tween()
    tween.tween_property(main_game_text, "visible_ratio", 1, text_speed)
    await tween.finished
    
    GameManager.current_text_changed.emit(text, text_data.get("id"))
    
    if extra_delay and not text_data.has("choices"):
        await give_continue_choice()
        
    if not text_data.get("follow_up", false) and text_data.has("text_2"):
        await display_followups(text_data)
        
    if text_data.has("choices") and not text_data.get("choices").is_empty():
        var choice_array: Array[String] = []
        for choice in text_data.get("choices"):
            choice_array.append(choice)
        give_choices(choice_array, text_data["choices"])

func display_followups(text_data: Dictionary) -> void:
    var index = 2
    while text_data.has("text_" + str(index)):
        var text_block = {
            "text": text_data["text_" + str(index)],
            "speed": text_data.get("speed", 1),
            "delay": text_data.get("delay", 0),
            "follow_up": true
        }
        await display_game_text(text_block)
        index += 1

func give_continue_choice() -> void:
    choices_container.visible = true
    var choice_button: Button = $MainDisplay/ScrollContainer/VBoxContainer/ChoicesContainer/Choices/Choice1
    choice_button.text = "Continue"
    await choice_button.pressed
    choices_container.visible = false

func give_choices(choices: Array[String], choice_dict: Dictionary) -> void:
    var i = 1
    for choice_name in choices:
        var choice_button: Button
        if i == 1:
            choice_button = choices_container.get_node("Choices/Choice1")
        else:
            choice_button = choices_container.get_node("Choices/Choice1").duplicate()
            choices_container.get_node("Choices").add_child(choice_button)
            choice_button.name = "Choice" + str(i)

        choice_button.text = choice_name
        choice_button.pressed.connect(func():
            handle_choice(choice_name, choice_dict)
        , CONNECT_ONE_SHOT)
        i += 1

    choices_container.visible = true

func handle_choice(choice_name: String, choice_dict: Dictionary) -> void:
    choices_container.visible = false
    for child in choices_container.get_node("Choices").get_children():
        if child.name != "Choice1":
            child.queue_free()

    var choice_data = choice_dict[choice_name]
    await display_game_text(choice_data)

    GameManager.choice_made.emit(choice_name, choice_data.get("id"))

func handle_intro() -> void:
    await display_game_text(DataHolder.scripted_encounters["first_message"])
    GameManager.choice_made.connect(func(_name: String, id: int):
        if id == DataHolder.scripted_encounters.get("first_message").get("choices").get("Be Aggressive").get("id"):
            await display_game_text(DataHolder.scripted_encounters.get("aggressive_intro_consequence"))
        elif id == DataHolder.scripted_encounters.get("first_message").get("choices").get("Be Diplomatic").get("id"):
            await display_game_text(DataHolder.scripted_encounters.get("passive_intro_consequence"))
        # switch to tutorial fight
        switch_to_battle(Opponent.new("Strange Entity", GameManager.Class.CursedSpirit, 100, GameManager.Grade.Grade4))
    , CONNECT_ONE_SHOT)
    
func switch_to_battle(opponent: Opponent) -> void:
    pass
