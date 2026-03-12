@icon("uid://csmikqph00s71")
extends Node3D
## Can add or subtract to an internal integer, and send that integer to other nodes. Has a minimum and maximum value for unique cases.

class_name Counter

## Emitted when the count is updated. Ensure you are sending count emitting, as methods will be looking for an integer
signal number_updated(count)
## Emitted when the minimum number has been reached
signal minimum_reached
## Emitted when the maximum number has been reached
signal maximum_reached

## Current number of the counter
@export var count : int = 0
## Increment size for each addition and subtraction
@export var step : int = 1
## maximum number that the counter can reach.
@export var max : int = 0
## minimum number that the counter can reach.
@export var min : int = 0

enum reset_states {DISABLED, RESET_TO_CLOSEST, RESET_TO_MIN, RESET_TO_MAX}
## Determines how a number should be handled when 
@export var out_of_range: reset_states

func _ready() -> void:
	if(step==0): step = 1

## Add a given number to the counters count
func add(num : int = step):
	count += num
	_check_min_max()
	number_updated.emit(count)

## Subtract a given number to the counters count
func subtract(num : int = step):
	count -= num
	_check_min_max()
	number_updated.emit(count)

## Resets the number to a given setting. Good for forcing max and min values
func reset(setting : reset_states = out_of_range):
	match setting:
		reset_states.RESET_TO_CLOSEST:
			count = clamp(count,min,max)
		reset_states.RESET_TO_MIN:
			count = min
		reset_states.RESET_TO_MAX:
			count = max
		reset_states.DISABLED:
			pass

func _check_min_max():
	if count >= min and count <= max: return
	reset()
	if(count == min): minimum_reached.emit()
	if(count == max): maximum_reached.emit()
