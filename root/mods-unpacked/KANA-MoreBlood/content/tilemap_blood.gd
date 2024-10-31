extends TileMap


const KANA_MOREBLOOD_LOG_NAME_TILEMAP := "KANA-MoreBlood:TileMap"

var current_texture_index := 0
var current_flip_x := false
var current_flip_y := true


func _ready() -> void:
	var entity_spawner := get_parent().get_node("EntitySpawner")
	entity_spawner.connect("enemy_spawned", self, "_on_enemy_spawned")


# Place random tile at possition of freed enemy
func draw_blood(map_position: Vector2) -> void:
	set_cell(map_position.x, map_position.y, current_texture_index, current_flip_x, current_flip_y)

	current_texture_index = (current_texture_index + 1) % 4
	if current_flip_y:
		current_flip_x = not current_flip_x
	if current_flip_x:
		current_flip_y = not current_flip_y


func _on_enemy_spawned(enemy: Enemy) -> void:
	enemy.connect("died", self, "_on_enemy_died")


func _on_enemy_died(enemy: Enemy, args: Enemy.DieArgs) -> void:
	var local_position = to_local(enemy.global_position)
	var map_position = world_to_map(local_position)

	draw_blood(map_position)

