extends Button
@export var Input_Action:StringName

func _ready() -> void:
	focus_mode=Control.FOCUS_NONE
	toggle_mode=true
	button_pressed=false
	add_key(Input_Action,text)


func _input(event: InputEvent) -> void:
	if button_pressed and event is InputEventKey:
		remove_key(Input_Action,text)
		text=OS.get_keycode_string(event.keycode)
		add_key(Input_Action,text)
		button_pressed=false


func add_key(Action:StringName,key:String):
	var Ki = InputEventKey.new()
	Ki.physical_keycode = OS.find_keycode_from_string(key)
	InputMap.action_add_event(Action, Ki)

func remove_key(Action:StringName,key:String):
	var Ki = InputEventKey.new()
	Ki.physical_keycode = OS.find_keycode_from_string(key)
	InputMap.action_erase_event(Action,Ki)
