extends Node2D

# set up getter, 
var width = 2
var height = 8
var depth = 2
var start_positions = [] setget ,_get_start_positions

func _ready():
	for x in range(width):
		start_positions.append([])
		start_positions[x] = []        
		for y in range(height):
			start_positions[x].append([])
			start_positions[x][y] = []
			for z in range(depth):
				start_positions[x][y].append([])
				start_positions[x][y][z] = []
	start_positions[0][0][0] = $x1_y1.get_name()
	start_positions[0][0][1] = $x1_y1.get_global_transform_with_canvas().get_origin()
	start_positions[0][1][0] = $x3_y1.get_name()
	start_positions[0][1][1] = $x3_y1.get_global_transform_with_canvas().get_origin()
	start_positions[0][2][0] = $x5_y1.get_name()
	start_positions[0][2][1] = $x5_y1.get_global_transform_with_canvas().get_origin()
	start_positions[0][3][0] = $x7_y1.get_name()
	start_positions[0][3][1] = $x7_y1.get_global_transform_with_canvas().get_origin()
	start_positions[0][4][0] = $x2_y2.get_name()
	start_positions[0][4][1] = $x2_y2.get_global_transform_with_canvas().get_origin()
	start_positions[0][5][0] = $x4_y2.get_name()
	start_positions[0][5][1] = $x4_y2.get_global_transform_with_canvas().get_origin()
	start_positions[0][6][0] = $x6_y2.get_name()
	start_positions[0][6][1] = $x6_y2.get_global_transform_with_canvas().get_origin()
	start_positions[0][7][0] = $x8_y2.get_name()
	start_positions[0][7][1] = $x8_y2.get_global_transform_with_canvas().get_origin()
	
	# black_start_positions.append($x1_y1.get_name())

func _get_start_positions():
	return start_positions