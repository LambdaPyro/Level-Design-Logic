extends EditorNode3DGizmoPlugin

const TR_MAT = preload("uid://ywpk3ytvjuqp")

func _get_gizmo_name():
	return "Trigger"

func _has_gizmo(node):
	return (node is CollisionShape3D and node.get_parent() is Trigger)


func _redraw(gizmo: EditorNode3DGizmo) -> void:
	gizmo.clear()
	var trigger = gizmo.get_node_3d()
	
	if trigger is CollisionShape3D:
		var new_mesh := BoxMesh.new()
		new_mesh.size = trigger.shape.size
		
		gizmo.add_mesh(new_mesh, TR_MAT)
