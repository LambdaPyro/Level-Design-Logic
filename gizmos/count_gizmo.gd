extends EditorNode3DGizmoPlugin

const COUNT_MAT = preload("uid://chxlleunke37t")

func _get_gizmo_name():
	return "Counters"

func _has_gizmo(node):
	return node is Counter

func _redraw(gizmo: EditorNode3DGizmo) -> void:
	gizmo.add_unscaled_billboard(COUNT_MAT, .5)
