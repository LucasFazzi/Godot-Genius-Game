extends Node2D

func _ready():
	start()


func start():
	get_node("/root/Ost").stop()
	get_node("Transition_Sprite").play("preparado")
	var waiting_timer = Timer.new()
	waiting_timer.set_wait_time(2)
	waiting_timer.set_one_shot(true)
	call_deferred("add_child", waiting_timer)
	waiting_timer.set_autostart(true)
	yield(waiting_timer, "timeout")
	get_node("Transition_Sprite").play("vamos_la")
	var waiting_timer_2 = Timer.new()
	waiting_timer_2.set_wait_time(2)
	waiting_timer_2.set_one_shot(true)
	call_deferred("add_child", waiting_timer_2)
	waiting_timer_2.set_autostart(true)
	yield(waiting_timer_2, "timeout")
	get_tree().call_deferred("change_scene","res://Scenes/Game.tscn")
