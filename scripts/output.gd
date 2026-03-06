@icon("res://addons/Level-Design-Logic/images/ArrowUp.svg")
extends Node

class_name Output

signal output_triggered
signal continue_logic

@export_range(0.0,10.0,.1, "or_greater") var delay : float = 0
@export var delay_next_output : bool = false

func _ready() -> void:
	assert(get_parent() is InputOutput, str(self) + " needs to be child of type 'InputOutput'")

func run_output() -> void:
	var input_output = get_parent()
	
	if delay != 0:
		print_rich("[i]" + name + ": awaiting delay[/i]")
		await get_tree().create_timer(delay).timeout
		print(name + ": delay finished")
	
	output_triggered.emit()
	
	if delay_next_output: emit_signal("continue_logic")
