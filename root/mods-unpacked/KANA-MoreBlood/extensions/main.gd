extends "res://main.gd"


func _ready() -> void:
	var tile_map_blood: TileMap = preload("res://mods-unpacked/KANA-MoreBlood/content/blood.tscn").instance()
	add_child_below_node(_tile_map_limits, tile_map_blood, true)
