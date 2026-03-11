extends EditorNode3DGizmoPlugin

const IO_MAT = preload("uid://dl0xt0ncb1lag")

func _get_gizmo_name():
	return "InputOutput"

func _has_gizmo(node):
	return node is InputOutput

func _redraw(gizmo: EditorNode3DGizmo) -> void:
	gizmo.add_unscaled_billboard(IO_MAT, .5)
