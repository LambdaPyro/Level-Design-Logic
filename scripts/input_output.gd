@icon("res://addons/Level-Design-Logic/images/InputOutput.svg")
@tool
extends Node3D
## Series of Outputs that are run once an input is recieved.

class_name InputOutput

## Triggers the [InputOutput] to run [Output]s.
signal input_triggered
## Sent once all [Output]s have been triggered.
signal outputs_triggered

## Creates a new [Output] node as a child
@export_tool_button("Add Output", "Add") var _button = _create_output

var _last_output

func _ready() -> void:
	input_triggered.connect(_run_outputs)

var _output : PackedScene = preload("res://addons/Level-Design-Logic/scenes/Output.tscn")
func _create_output() -> void:
	var new_output : Output = _output.instantiate()
	var output_name = "Output_" + str(get_child_count())
	new_output.name = output_name
	add_child(new_output)
	new_output.owner = get_tree().edited_scene_root

## Remove the last added [Output] from the hierarchy.
## @experimental
func remove_last_output():
	get_node(_last_output).queue_free()

func _run_outputs():
	for o in get_children():
		o.run_output()
		if o.delay != 0 and o.delay_next_output:
			await o.continue_logic
	print(name + ": Reached end final output")
	outputs_triggered.emit()
