extends EditorNode3DGizmoPlugin

const BS_MAT = preload("uid://dfffhh8asbscx")

func _get_gizmo_name():
	return "BooleanSwitch"

func _has_gizmo(node):
	return node is BooleanSwitch

func _redraw(gizmo: EditorNode3DGizmo) -> void:
	gizmo.add_unscaled_billboard(BS_MAT, .5)
