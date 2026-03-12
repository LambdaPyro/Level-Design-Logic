extends RayCast3D

func get_interactable():
	if is_colliding():
		var int_obj = get_collider() as Interactable
		int_obj.interact("Player")

func interaction_test():
	print("Interacted! You got a health point!")
