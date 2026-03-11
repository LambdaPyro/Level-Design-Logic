extends Node3D

@onready var bs: BooleanSwitch = $BooleanSwitch


func _ready() -> void:
	_full_test()

func boolean_changed():
	print("The boolean has changed!")

func test_boolean_true():
	print_rich("[color=cyan]True")

func test_boolean_false():
	print_rich("[color=red]False")

func _full_test():
	bs.run_boolean_state()
