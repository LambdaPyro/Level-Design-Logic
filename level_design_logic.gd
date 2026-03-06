@tool
extends EditorPlugin

const IOGIZMO = preload("res://addons/Level-Design-Logic/gizmos/io_gizmo.gd")

var io_gizmo = IOGIZMO.new()

func _enable_plugin() -> void:
	# Add autoloads here.
	pass


func _disable_plugin() -> void:
	# Remove autoloads here.
	pass


func _enter_tree() -> void:
	# Initialization of the plugin goes here.
	add_node_3d_gizmo_plugin(io_gizmo)
	pass


func _exit_tree() -> void:
	# Clean-up of the plugin goes here.
	remove_node_3d_gizmo_plugin(io_gizmo)
	pass
