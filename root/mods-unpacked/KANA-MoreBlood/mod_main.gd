extends Node


const KANA_MOREBLOOD_DIR := "KANA-MoreBlood"
const KANA_MOREBLOOD_LOG_NAME := "KANA-MoreBlood:Main"

var mod_dir_path := ""
var extensions_dir_path := ""
var translations_dir_path := ""

# blood_color #9f2727

func _init(modloader = ModLoader) -> void:
	mod_dir_path = ModLoaderMod.get_unpacked_dir().plus_file(KANA_MOREBLOOD_DIR)
	# Add extensions
	install_script_extensions()


func install_script_extensions() -> void:
	extensions_dir_path = mod_dir_path.plus_file("extensions")
	ModLoaderMod.install_script_extension(extensions_dir_path.plus_file("main.gd"))
