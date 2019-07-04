extends Node2D

signal entered_node_bounce

func _
	emit_signal("_entered_node")

func _ready():
	self.connect("entered_node", self, "_entered_node")

func _get_start_positions():
	return start_positions

func 
