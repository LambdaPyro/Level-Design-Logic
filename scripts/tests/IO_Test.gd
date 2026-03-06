extends Node

var is_output_delayed : bool = true

@export var expected_results : int = 4
var success : int = 0
var failures : int = 0

var pass_color : String = "green"
var fail_color : String = "red"

func _ready() -> void:
	$InputOutput.emit_signal("input_triggered")

func test_output(o_name : String):
	print_rich("[color=" + pass_color + "]" + o_name + ": Success")
	success += 1

func test_output_delay_next(o_name : String):
	var pr_color = fail_color
	var test_state : String = ": Failed"
	if(is_output_delayed):
		test_state = ": Success"
		pr_color = pass_color
		success += 1
	else:
		failures += 1
	print_rich("[color=" + pr_color + "]" + o_name + test_state)

func output_delayed():
	is_output_delayed = false

func IO_results():
	var pr_color = pass_color
	if(success!=expected_results):
		failures+=1
	if(failures>0):
		pr_color = fail_color
		
	print_rich("[b][color=" + pr_color + "]" + "TEST DONE!")	
	print_rich("[color=" + pr_color + "]" + str(failures) + " failures")
