@icon("res://addons/Level-Design-Logic/images/Random.svg")
extends Node3D
## Creates a random integer between a minimum and maximum value.
class_name Randomizer

## Sends a random number in range
signal random_num_generated(value)

## maximum number that the randomizer can reach.
@export var max : int = 10
## minimum number that the randomizer can reach.
@export var min : int = 0

func _ready():
	assert(min < max, str(self) + ": minimum value cannot be greater than or equal to max")


## generates a random number between the minimum and maximum number
func get_random_number():
	var rand_num = randi_range(min, max)
	random_num_generated.emit(rand_num)
