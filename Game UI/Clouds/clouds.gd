@tool
extends MeshInstance3D


func _process(_delta: float) -> void: 
	
	# uv global position of texture
	var pos=Vector2(global_position.x*0.000025,global_position.z*0.000025)
	self.mesh.material.set_shader_parameter("World_Position",pos)
	
	# mesh global positopn according to camera
	var gp=Vector3.ZERO
	if Engine.is_editor_hint():
		gp=EditorInterface.get_editor_viewport_3d(0).get_camera_3d().global_position
	else:gp=get_viewport().get_camera_3d().global_position
	global_position=Vector3(gp.x,0,gp.z)
