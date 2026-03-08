@icon("res://addons/Level-Design-Logic/images/InputOutput.svg")
@tool
extends Node3D
## Series of Outputs that are run once an input is recieved.

class_name InputOutput

## Sent once [member get_input()] has been triggered.
signal input_triggered
## Sent when an output is triggered (only works if [member get_input()] runs an specific index of the outputs)
signal output_triggered
## Sent once all [Output]s have been triggered.
signal outputs_triggered

## Creates a new [Output] node as a child
@export_tool_button("Add Output", "Add") var button = _create_output

var _last_output

var _output : PackedScene = preload("res://addons/Level-Design-Logic/scenes/Output.tscn")
func _create_output() -> void:
	var new_output : Output = _output.instantiate()
	var output_name = "Output_" + str(get_child_count())
	new_output.name = output_name
	add_child(new_output)
	new_output.owner = get_tree().edited_scene_root

func _run_all_outputs() -> void:
	for o in get_children():
		o.run_output()
		if o.delay != 0 and o.delay_next_output:
			await o.continue_logic
	print(name + ": Reached end final output")
	outputs_triggered.emit()

## Triggers the [InputOutput] to either run all outputs or a specific output.[br]
## If the output index is less than 0, run all outputs
func get_input(output_index : int = -1) -> void:
	input_triggered.emit()
	
	if(output_index < 0): _run_all_outputs(); return
	
	if(output_index>=get_child_count()):
		print_rich("[b][color=red]"+str(self)+":[b] output_index "+str(output_index)+" out of bounds") 
		return
	
	get_child(output_index).run_output()
	output_triggered.emit()
