@icon("res://addons/Level-Design-Logic/images/ArrowUp.svg")
extends Node

class_name Output

signal output_triggered

@export_range(0.0,10.0,.1,"or_less", "or_greater") var delay : float = 0
@export var delay_next_output : bool = true

func run_output() -> void:
	var input_output = get_parent()
	
	if !delay_next_output: input_output.emit_signal("continue_logic")
	
	if delay != 0:
		await get_tree().create_timer(delay).timeout
	
	output_triggered.emit()
	
	if delay_next_output: input_output.emit_signal("continue_logic")
