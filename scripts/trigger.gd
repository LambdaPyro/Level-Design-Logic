@icon("uid://cj6n58xdhx48c")
@tool
extends Area3D
## Area3D with better visualization, options to enable and disable types, and check if any node entering has the same name as a given string

class_name Trigger

## Only allow the outputs to run in order once
@export var run_once : bool = false
var _can_run : bool = true

## Determines if the Trigger should check for either of the types below.
## Area = 1
## Body = 2
@export_flags("Area", "Body") var check_types = 3
const AREA := 1 << 0
const BODY := 1 << 1

## Compares a String to the name of any area or body that goes inside the Trigger. If it matches, it will emit the appropriate trigger.
## By default, the String is empty. This parameter is ignored when the string is empty.
@export var specific_node : String = ""

@export_category("Editor Tool")
## Creates a new [CollisionShape3D] node as a child.
@export_tool_button("Add Collider", "Add") var button = _create_collider

## Emitted once an area enters the trigger
signal trigger_area_entered
## Emitted once an area exited the trigger
signal trigger_area_exited
## Emitted once a body enters the trigger
signal trigger_body_entered
## Emitted once a body exited the trigger
signal trigger_body_exited

func _ready() -> void:
	_update_check_types()

func _create_collider():
	var new_coll : CollisionShape3D = CollisionShape3D.new()
	new_coll.shape = BoxShape3D.new()
	new_coll.name = "Collider"
	
	add_child(new_coll)
	new_coll.owner = get_tree().edited_scene_root

func _on_area_entered(area: Area3D) -> void:
	if(!_can_run): return
	if(!specific_node.is_empty() and area.name != specific_node): return
	
	trigger_area_entered.emit()
	if(run_once): _can_run = false


func _on_area_exited(area: Area3D) -> void:
	if(!_can_run): return
	if(!specific_node.is_empty() and area.name != specific_node): return
	
	trigger_area_exited.emit()
	if(run_once): _can_run = false


func _on_body_entered(body: Node3D) -> void:
	if(!_can_run): return
	if(!specific_node.is_empty() and body.name != specific_node): return
	
	trigger_body_entered.emit()
	if(run_once): _can_run = false


func _on_body_exited(body: Node3D) -> void:
	if(!_can_run): return
	if(!specific_node.is_empty() and body.name != specific_node): return
	
	trigger_body_exited.emit()
	if(run_once): _can_run = false

## Set new value for Specific Node string
func set_specific_node(new_string : String):
	specific_node = new_string

## Set new value for Check Types bitmask
## Area = 1
## Body = 2
func set_check_types(new_types : int):
	if(new_types < 0 or new_types > 3):
		print_rich("[b][color=red]invalid int for bitmask of set_check_types"); return
	_update_check_types()

func _update_check_types():
	if(check_types & AREA):
		area_entered.connect(_on_area_entered)
		area_exited.connect(_on_area_exited)
	else:
		if(area_entered.is_connected(_on_area_entered)): area_entered.disconnect(_on_area_entered)
		if(area_exited.is_connected(_on_area_exited)): area_exited.disconnect(_on_area_exited)
	
	if(check_types & BODY):
		body_entered.connect(_on_body_entered)
		body_exited.connect(_on_body_exited)
	else:
		if(body_entered.is_connected(_on_body_entered)): body_entered.disconnect(_on_body_entered)
		if(body_exited.is_connected(_on_body_exited)): body_exited.disconnect(_on_body_exited)
