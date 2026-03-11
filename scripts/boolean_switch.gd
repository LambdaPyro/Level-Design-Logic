@icon("res://addons/Level-Design-Logic/images/BooleanSwitch.svg")
extends Node3D
## Logic Gate that holds a boolean value. This value determines what signal will be sent and allows for manual changing of said boolean

class_name BooleanSwitch

## Sent once the [BooleanSwitch]s bool has changed from its original value
signal bool_changed

## Sent once the true state is triggered
signal boolean_true_triggered
## Sent once the false state is triggered
signal boolean_false_triggered

## Primary boolean used to determine what signal should be sent
@export var switch : bool

## Changes the value of [member switch] to a given state or the opposite of its current state
func change_boolean_state(new_bool_state : bool = !switch, run_new_state : bool = false):
	switch = new_bool_state
	bool_changed.emit()
	if(run_new_state): run_boolean_state()

## Run the [BooleanSwitch] and determine which signal to run based on [member switch]
func run_boolean_state() -> void:
	if(switch):
		boolean_true_triggered.emit()
	else:
		boolean_false_triggered.emit()
