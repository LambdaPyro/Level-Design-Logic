@tool
extends EditorPlugin

const ConnectionsGizmo = preload("uid://48j08ggyn02e")

const IoGizmo = preload("uid://c4ra7c6ho1rdn")
const BsGizmo = preload("uid://cwx858yv0p1cw")
const TrGizmo = preload("uid://dwr5px7egx4os")
const CountGizmo = preload("uid://b1hnchixs27bv")
const RandomGizmo = preload("uid://cy4mhsww8q3q5")
const InteractableGizmo = preload("uid://bo7hr1n201imw")

var connections_gizmo = ConnectionsGizmo.new()

var io_gizmo = IoGizmo.new()
var bs_gizmo = BsGizmo.new()
var tr_gizmo = TrGizmo.new()
var count_gizmo = CountGizmo.new()
var random_gizmo = RandomGizmo.new()
var interact_gizmo = InteractableGizmo.new()

func _enable_plugin() -> void:
	# Add autoloads here.
	pass


func _disable_plugin() -> void:
	# Remove autoloads here.
	pass


func _enter_tree() -> void:
	# Initialization of the plugin goes here.
	add_node_3d_gizmo_plugin(connections_gizmo)
	
	add_node_3d_gizmo_plugin(io_gizmo)
	add_node_3d_gizmo_plugin(bs_gizmo)
	add_node_3d_gizmo_plugin(tr_gizmo)
	add_node_3d_gizmo_plugin(count_gizmo)
	add_node_3d_gizmo_plugin(random_gizmo)
	add_node_3d_gizmo_plugin(interact_gizmo)


func _exit_tree() -> void:
	# Clean-up of the plugin goes here.
	remove_node_3d_gizmo_plugin(connections_gizmo)
	
	remove_node_3d_gizmo_plugin(io_gizmo)
	remove_node_3d_gizmo_plugin(bs_gizmo)
	remove_node_3d_gizmo_plugin(tr_gizmo)
	remove_node_3d_gizmo_plugin(count_gizmo)
	remove_node_3d_gizmo_plugin(random_gizmo)
	remove_node_3d_gizmo_plugin(interact_gizmo)
