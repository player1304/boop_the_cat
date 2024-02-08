extends CharacterBody2D

var next_pos : Vector2
var can_move : bool = true

func _physics_process(_delta):
	var grid = $"..".astar_grid
	var player_loc_id = (self.position - Vector2(4,4)) / grid.cell_size
	var enemy_loc_id = ($"../Enemy".position - Vector2(4,4)) / grid.cell_size
	
	var direction = Input.get_vector("ui_left","ui_right", "ui_up", "ui_down")
	
	# check if next d allowed. if allowed, update	
	var next_loc_id : Vector2 = player_loc_id + direction
	if grid.region.has_point(next_loc_id) and can_move and grid.is_point_solid(next_loc_id) == false: # valid
		next_pos = (next_loc_id * grid.cell_size) + Vector2(4,4)
		can_move = false
	else: # reset detector
		next_loc_id = player_loc_id
	
	# TODO check if next_pos is enemy and print game over
	self.position = next_pos
	


func _on_move_timer_timeout():
	can_move = true
