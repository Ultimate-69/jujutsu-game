extends Node

const PASS_KEY = "fhdiuawyfhioaw901279172"

var save_path = "user://game.save"
var save_data = {
    "test" = 1
}

## Save configs to separate cfg/ini file. TODO
## Choose save slot depending on current loaded save. If in menu, then no need to save data anyways. TODO
func save_game() -> void:
    var file := FileAccess.open_encrypted_with_pass(save_path, FileAccess.WRITE, PASS_KEY)
    file.store_string(JSON.stringify(save_data))
    
func load_game() -> void:
    var file := FileAccess.open_encrypted_with_pass(save_path, FileAccess.READ, PASS_KEY)
    if file == null:
        # opened incorrectly
        return
    var save_data_loaded: String = file.get_as_text()    
