extends Node2D

func _ready():
	disable_things()
	play_OST()


func disable_things():
	get_node("Button_Volume_Mute").visible = false
	get_node("Button_Volume_Mute").disabled = true
	get_node("Button_Voltar").visible = false
	get_node("Button_Voltar").disabled = true
	get_node("Sobre_O_Jogo_Text").visible = false

func play_OST():
	get_node("/root/Ost").play(9)
	pass

func _on_Button_Jogar_pressed():
	if not get_node("Button_Animation").is_playing():
		get_node("Button_Animation").play("button_jogar")
	if not get_node("Button_Click").is_playing():
		get_node("Button_Click").play()
	var waiting_timer = Timer.new()
	waiting_timer.set_wait_time(0.5)
	waiting_timer.set_one_shot(true)
	call_deferred("add_child", waiting_timer)
	waiting_timer.set_autostart(true)
	yield(waiting_timer, "timeout")
	get_tree().call_deferred("change_scene","res://Scenes/Transition_Preparado.tscn")

func _on_Button_Sobre_O_Jogo_pressed():
	if not get_node("Button_Animation").is_playing():
		get_node("Button_Animation").play("button_sobre_o_jogo")
	if not get_node("Button_Click").is_playing():
		get_node("Button_Click").play()
	var waiting_timer = Timer.new()
	waiting_timer.set_wait_time(0.5)
	waiting_timer.set_one_shot(true)
	call_deferred("add_child", waiting_timer)
	waiting_timer.set_autostart(true)
	yield(waiting_timer, "timeout")
	get_node("Nome_Jogo").visible = false
	get_node("Button_Jogar").visible = false
	get_node("Button_Jogar").disabled = true
	get_node("Button_Sobre_O_Jogo").visible = false
	get_node("Button_Sobre_O_Jogo").disabled = true
	get_node("Button_Sair").visible = false
	get_node("Button_Sair").disabled = true
	get_node("Button_Voltar").visible = true
	get_node("Button_Voltar").disabled = false
	get_node("Sobre_O_Jogo_Text").visible = true

func _on_Button_Sair_pressed():
	if not get_node("Button_Animation").is_playing():
		get_node("Button_Animation").play("button_sair")
	if not get_node("Button_Click").is_playing():
		get_node("Button_Click").play()
	var waiting_timer = Timer.new()
	waiting_timer.set_wait_time(0.5)
	waiting_timer.set_one_shot(true)
	call_deferred("add_child", waiting_timer)
	waiting_timer.set_autostart(true)
	yield(waiting_timer, "timeout")
	get_tree().quit()

func _on_Button_Volume_pressed():
	if not get_node("Button_Click").is_playing():
		get_node("Button_Click").play()
	get_node("Button_Volume").visible = false
	get_node("Button_Volume").disabled = true
	get_node("Button_Volume_Mute").visible = true
	get_node("Button_Volume_Mute").disabled = false
	get_node("/root/Ost").volume_db = -200

func _on_Button_Volume_Mute_pressed():
	if not get_node("Button_Click").is_playing():
		get_node("Button_Click").play()
	get_node("Button_Volume").visible = true
	get_node("Button_Volume").disabled = false
	get_node("Button_Volume_Mute").visible = false
	get_node("Button_Volume_Mute").disabled = true
	get_node("/root/Ost").volume_db = 0

func _on_Button_Voltar_pressed():
	if not get_node("Button_Animation").is_playing():
		get_node("Button_Animation").play("button_voltar")
	if not get_node("Button_Click").is_playing():
		get_node("Button_Click").play()
	var waiting_timer = Timer.new()
	waiting_timer.set_wait_time(0.5)
	waiting_timer.set_one_shot(true)
	call_deferred("add_child", waiting_timer)
	waiting_timer.set_autostart(true)
	yield(waiting_timer, "timeout")
	get_node("Sobre_O_Jogo_Text").visible = false
	get_node("Button_Voltar").visible = false
	get_node("Button_Voltar").disabled = true
	get_node("Nome_Jogo").visible = true
	get_node("Button_Jogar").visible = true
	get_node("Button_Jogar").disabled = false
	get_node("Button_Sobre_O_Jogo").visible = true
	get_node("Button_Sobre_O_Jogo").disabled = false
	get_node("Button_Sair").visible = true
	get_node("Button_Sair").disabled = false
