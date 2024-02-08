extends CharacterBody2D

var next_pos : Vector2
var grid : Object
var player_loc_id : Vector2
var self_loc_id : Vector2

func _ready():
	$MoveTimer.start()
	grid = $"..".astar_grid

func _on_move_timer_timeout():		
	# TODO CHECK WALL
	# use top-left as origin, in line with the a* grid
	player_loc_id = ($"../Player".position - Vector2(4,4)) / grid.cell_size
	self_loc_id = (self.position - Vector2(4,4)) / grid.cell_size
	
	var path = grid.get_point_path(self_loc_id, player_loc_id)
	if type_string(typeof(path)) == "PackedVector3Array": # thread safety check
		pass
	else:
		next_pos = path[1] + Vector2(4,4)
		if next_pos == $"../Player".position:
			print("GAME OVER")
			$MoveTimer.stop()
			self.position = $"../Player".position
		else:
			# go to next location
			self.position = path[1] + Vector2(4,4)
