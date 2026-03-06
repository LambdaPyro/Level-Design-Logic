@icon("res://addons/Level-Design-Logic/images/InputOutput.svg")
@tool
extends Node3D
class_name InputOutput

var undo_redo : EditorUndoRedoManager

signal input_triggered
signal outputs_triggered

#RELOAD PROJECT WHEN ALTERING
@export_tool_button("Add Output", "Add") var button = create_output

var last_output

func _ready() -> void:
	input_triggered.connect(run_outputs)

var output : PackedScene = preload("res://addons/Level-Design-Logic/scenes/Output.tscn")
func create_output() -> void:
	var new_output : Output = output.instantiate()
	var output_name = "Output_" + str(get_child_count())
	new_output.name = output_name
	add_child(new_output)
	new_output.owner = get_tree().edited_scene_root

func remove_last_output():
	get_node(last_output).queue_free()

func run_outputs():
	for o in get_children():
		o.run_output()
		if o.delay != 0 and o.delay_next_output:
			await o.continue_logic
	print(name + ": Reached end final output")
	outputs_triggered.emit()
