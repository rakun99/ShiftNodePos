tool
extends EditorPlugin

var can_handle = true
var node_arr :Array= []
func  _ready() -> void:
	get_editor_interface().get_selection().connect("selection_changed",self, "on_selection_changed")
#	print("can move nodes")

func handles(object: Object) -> bool:
####	"""
####	Required to use forward_canvas_draw_... below
####	"""
	return can_handle
	
func forward_canvas_gui_input(event: InputEvent) -> bool:
#	if event is InputEventMouseMotion:
#		update_overlays()
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and Input.is_key_pressed(KEY_SHIFT) :
		var scene_root = get_tree().get_edited_scene_root()
		var mouse_coords = scene_root.get_global_mouse_position()
#		print(mouse_coords)
		if !node_arr.empty():
			for node in node_arr:
				node.global_position =mouse_coords

		return true
	return false

func on_selection_changed():
	node_arr =get_editor_interface().get_selection().get_selected_nodes()
#	print(node_arr)
func _enter_tree() -> void:
	
	pass


func _exit_tree() -> void:
	pass
