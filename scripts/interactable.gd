@icon("res://addons/Level-Design-Logic/images/Interaction.svg")
@tool
extends Area3D
## Simple Input trigger for Level Design Logic. Intended for players to "interact" with scripted sequences
class_name Interactable

## Emitted once the object has been interacted with
signal interacted

## Acts as secret_code, to see if an entity should interact with it. Good for seperating Player and NPC interactions.
## Good example would be having all NPCs emit and interaction signal with a string called "NPC." This would allow NPCs to have interactables that only accept their input.
@export var secret_code : String = ""

## Only allow the outputs to run in order once
@export var run_once : bool = false
var _can_run : bool = true

@export_category("Editor Tool")
## Creates a new [CollisionShape3D] node as a child.
@export_tool_button("Add Collider", "Add") var button = _create_collider

func _create_collider():
	var new_coll : CollisionShape3D = CollisionShape3D.new()
	new_coll.shape = BoxShape3D.new()
	new_coll.name = "Collider"
	
	add_child(new_coll)
	new_coll.owner = get_tree().edited_scene_root

## Tells the Interactable that an entity has interacted with it
func interact(guess : String = secret_code):
	if(!_can_run): return
	if(!secret_code.is_empty() and guess != secret_code): return
	
	interacted.emit()
	
	if(run_once): _can_run = false
