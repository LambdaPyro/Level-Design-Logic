@icon("res://addons/Level-Design-Logic/images/ArrowUp.svg")
extends Node
## Child of InputOutput, sends a signal after running all logic. Includes options for delaying both current and following [Output]s.
class_name Output

## Sent once all logic is ran. Connect to anything you want triggered.
signal output_triggered
## Triggers the parent [InputOutput] to continue the logic if there is a delay.
signal continue_logic

## How long the [Output] should wait before sending signals.
@export_custom(PROPERTY_HINT_NONE, "suffix: Seconds") var delay : float = 0:
	set(val):
		delay = val
		notify_property_list_changed()
## Determines if the succeeding [Output] should await for this one to finish.
@export var delay_next_output : bool = false

func _validate_property(property: Dictionary):
	if property.name == "delay_next_output" and delay == 0:
		delay_next_output = false
		property.usage |= PROPERTY_USAGE_READ_ONLY

func _ready() -> void:
	assert(get_parent() is InputOutput, str(self) + " needs to be child of type 'InputOutput'")

## Runs logic of the [Output] with given parameters.
func run_output() -> void:
	var input_output = get_parent()
	
	if delay != 0:
		print_rich("[i]" + name + ": awaiting delay[/i]")
		await get_tree().create_timer(delay).timeout
		print(name + ": delay finished")
	
	output_triggered.emit()
	
	if delay_next_output: emit_signal("continue_logic")
