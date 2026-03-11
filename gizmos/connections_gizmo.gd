extends EditorNode3DGizmoPlugin

const COUNT_MAT = preload("uid://chxlleunke37t")
const ARROW_UP = preload("uid://d1q2o82lhumnw")
const CONNECTION_MAT = preload("uid://cy782e430u1j6")

func _init():
	create_handle_material("handles")

func _get_gizmo_name():
	return "Connections"

func _has_gizmo(node):
	var ldl_types = [InputOutput, BooleanSwitch, Trigger, Counter, Randomizer, Interactable]

	for i in ldl_types:
		if is_instance_of(node, i):
			return true
	return false

func _redraw(gizmo: EditorNode3DGizmo) -> void:
	gizmo.clear()
	
	var node3d = gizmo.get_node_3d()
	var start : Vector3 = Vector3.ZERO
	var end
	var lines = PackedVector3Array()
	var handles = PackedVector3Array()
	
	#for each signal in node3d, create a dictionary of signals connected to another node
	for s in node3d.get_signal_list():
		var connected_nodes = node3d.get_signal_connection_list(s.name)
		
		#if the node is an inputoutput object, add all of its childrens signals to the dictionary
		if node3d is InputOutput: 
			for o in node3d.get_children():
				connected_nodes += o.get_signal_connection_list(s.name)
		
		# get each connected node and draw a line towards its position
		for n in connected_nodes:
			var node : Callable = n.callable
			if node.get_object() is Node3D:
				var target = node.get_object() as Node3D
				end = node3d.to_local(target.global_position)
				if(lines.has(end)): continue
			else:
				continue
			
			lines.push_back(start)
			lines.push_back(end)
			
			handles.push_back(start)
			handles.push_back(end)
	
	if lines.size() == 0: return
	
	gizmo.add_lines(lines, CONNECTION_MAT, false)
	gizmo.add_handles(handles, get_material("handles", gizmo), [])
