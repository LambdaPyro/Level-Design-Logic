extends EditorNode3DGizmoPlugin

const RANDOM_MAT = preload("uid://7itundqx3fte")

func _get_gizmo_name():
	return "Randomizers"

func _has_gizmo(node):
	return node is Randomizer

func _redraw(gizmo: EditorNode3DGizmo) -> void:
	gizmo.add_unscaled_billboard(RANDOM_MAT, .5)
