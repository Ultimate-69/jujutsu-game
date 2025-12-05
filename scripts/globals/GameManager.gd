extends Node

var save_path = "user://save_"
var current_slot = 1
var save_data = {
    "slot_1": {
        "name": "",
        "technique": "",
        "heavenly_restriction": "", # 0 = none, 1 = toji, 2 = mai but better
        "affiliation": "",
        "scenario": "",
        "stats": {
            "strength": 0,
            "speed": 0,
            "durability": 0,
            "perception": 0,
            "cursed_energy": 0,
        },
        "gameplay_data": {
            
        }
    }   
}
var is_new_game: bool = true

## Save configs to separate cfg/ini file. TODO
## Choose save slot depending on current loaded save. If no data, then no need to save data anyways. TODO
func save_game() -> void:
    if save_data["slot_" + str(current_slot)]["name"] == "": return 
    var file := FileAccess.open(save_path + str(current_slot) + ".save", FileAccess.WRITE)
    file.store_var(save_data["slot_" + str(current_slot)], true)
    file.close()
    
func does_save_exist_at_slot(slot: int) -> bool:
    if FileAccess.file_exists(save_path + str(slot) + ".save"): return true
    return false
    
func load_game() -> void:
    var file := FileAccess.open(save_path + str(current_slot) + ".save", FileAccess.READ)
    if file == null:
        # opened incorrectly
        return
    var loaded_data = file.get_var(true)
    if loaded_data is not Dictionary:
        file.close()
        return # TODO warn about failed load
    save_data["slot_" + str(current_slot)] = loaded_data
    file.close()
