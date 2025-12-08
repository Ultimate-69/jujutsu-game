class_name Opponent extends Node

var opponent_name: String = "Opponent"
var opponent_class: GameManager.Class = GameManager.Class.CursedSpirit
var health: float = 100.0
var grade: GameManager.Grade = GameManager.Grade.Grade4
var stats: Dictionary[String, int] = {
    "strength" = 0,
    "speed" = 0,
    "durability" = 0,
    "perception" = 0,
    "cursed_energy" = 0
}

# very convoluted constructor, don't mind it.
func _init(nme: String = "Opponent", cls: GameManager.Class = GameManager.Class.CursedSpirit, 
    hp: float = 100.0, gr: GameManager.Grade = GameManager.Grade.Grade4, 
    stats: Dictionary[String, int] = {
        "strength" = 0,
        "speed" = 0,
        "durability" = 0,
        "perception" = 0,
        "cursed_energy" = 0
    }) -> void:
    self.opponent_name = nme
    self.opponent_class = cls
    self.health = hp
    self.grade = gr
    self.stats = stats
