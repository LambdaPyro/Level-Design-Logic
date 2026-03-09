@tool
extends EditorPlugin

const IoGizmo = preload("res://addons/Level-Design-Logic/gizmos/io_gizmo.gd")
const BsGizmo = preload("res://addons/Level-Design-Logic/gizmos/bs_gizmo.gd")

var io_gizmo = IoGizmo.new()
var bs_gizmo = BsGizmo.new()

func _enable_plugin() -> void:
	# Add autoloads here.
	pass


func _disable_plugin() -> void:
	# Remove autoloads here.
	pass


func _enter_tree() -> void:
	# Initialization of the plugin goes here.
	add_node_3d_gizmo_plugin(io_gizmo)
	add_node_3d_gizmo_plugin(bs_gizmo)
	pass


func _exit_tree() -> void:
	# Clean-up of the plugin goes here.
	remove_node_3d_gizmo_plugin(io_gizmo)
	remove_node_3d_gizmo_plugin(bs_gizmo)
	pass
