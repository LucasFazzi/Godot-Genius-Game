extends Node2D

func _ready():
	start()

func start():
	var waiting_timer = Timer.new()
	waiting_timer.set_wait_time(4)
	waiting_timer.set_one_shot(true)
	call_deferred("add_child", waiting_timer)
	waiting_timer.set_autostart(true)
	yield(waiting_timer, "timeout")
	get_tree().call_deferred("change_scene","res://Scenes/MainScene.tscn")
	pass
