extends Node

@onready var randomizer: Randomizer = $Randomizer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomizer.get_random_number()

func output_0_result():
	print("0")

func output_1_result():
	print("1")

func output_2_result():
	print("2")
