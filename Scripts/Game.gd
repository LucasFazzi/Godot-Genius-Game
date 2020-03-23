extends Node2D

var forms = [1,2,3,4]
var array_number_of_time_bot_plays = []
var number_of_time_bot_plays
var number_of_bot_played = 0
var guard_information = []
var forms_sum
var can_click = true
var player_can_play = false
var your_information_pressed = []
var frame_bot_color
var sound_bot_color
var can_play_correct = true
var can_play_wrong = true

func _ready():
	randomic_start()
	first_bot_play()

func _process(delta):
	press_button()
	check_information()

func randomic_start():
	get_node("/root/Ost").stop()
	array_number_of_time_bot_plays.resize(Global.global_number_of_times_bot_plays)
	number_of_time_bot_plays = array_number_of_time_bot_plays.size()
	randomize()
	forms.shuffle()

func first_bot_play():
	if Global.global_number_of_times_bot_plays <= 4:
		while number_of_bot_played < number_of_time_bot_plays:
			get_node("Bot_Color_1").visible = false
			guard_information.append(forms[0])
			Global.global_guard_number = guard_information
			check_button_color()
			check_button_sound()
			var waiting_timer = Timer.new()
			waiting_timer.set_wait_time(2.5)
			waiting_timer.set_one_shot(false)
			call_deferred("add_child", waiting_timer)
			waiting_timer.set_autostart(true)
			yield(waiting_timer, "timeout")
			forms.shuffle()
			number_of_bot_played += 1
		if number_of_bot_played >= number_of_time_bot_plays:
			check_bot_finish()

	if Global.global_number_of_times_bot_plays > 4:
		number_of_bot_played += 1
		while number_of_bot_played < number_of_time_bot_plays:
			get_node("Bot_Color_1").visible = false
			check_button_color()
			check_button_sound()
			guard_information.append(Global.global_guard_number[0])
			var waiting_timer = Timer.new()
			waiting_timer.set_wait_time(2.5)
			waiting_timer.set_one_shot(false)
			call_deferred("add_child", waiting_timer)
			waiting_timer.set_autostart(true)
			yield(waiting_timer, "timeout")
			Global.global_guard_number.push_back(Global.global_guard_number[0])
			Global.global_guard_number.pop_front()
			number_of_bot_played += 1

		while number_of_bot_played == number_of_time_bot_plays:
			get_node("Bot_Color_1").visible = false
			check_button_color()
			check_button_sound()
			forms.shuffle()
			guard_information.append(forms[0])
			Global.global_guard_number = guard_information
			check_bot_finish()
			return

func check_button_color():
	if Global.global_number_of_times_bot_plays <= 4:
		var waiting_timer = Timer.new()
		waiting_timer.set_wait_time(1)
		waiting_timer.set_one_shot(false)
		call_deferred("add_child", waiting_timer)
		waiting_timer.set_autostart(true)
		yield(waiting_timer, "timeout")
		get_node("Bot_Color_1").visible = true
		frame_bot_color = forms[0]
		get_node("Bot_Color_1").play(str(frame_bot_color))
	if Global.global_number_of_times_bot_plays > 4:
		if number_of_bot_played < number_of_time_bot_plays:
			var waiting_timer = Timer.new()
			waiting_timer.set_wait_time(1)
			waiting_timer.set_one_shot(false)
			call_deferred("add_child", waiting_timer)
			waiting_timer.set_autostart(true)
			yield(waiting_timer, "timeout")
			get_node("Bot_Color_1").visible = true
			frame_bot_color = Global.global_guard_number[0]
			get_node("Bot_Color_1").play(str(frame_bot_color))
		if number_of_bot_played == number_of_time_bot_plays:
			var waiting_timer = Timer.new()
			waiting_timer.set_wait_time(1)
			waiting_timer.set_one_shot(false)
			call_deferred("add_child", waiting_timer)
			waiting_timer.set_autostart(true)
			yield(waiting_timer, "timeout")
			get_node("Bot_Color_1").visible = true
			frame_bot_color = forms[0]
			get_node("Bot_Color_1").play(str(frame_bot_color))

func check_button_sound():
	if Global.global_number_of_times_bot_plays <= 4:
		var waiting_timer = Timer.new()
		waiting_timer.set_wait_time(1)
		waiting_timer.set_one_shot(false)
		call_deferred("add_child", waiting_timer)
		waiting_timer.set_autostart(true)
		yield(waiting_timer, "timeout")
		sound_bot_color = forms[0]
	if Global.global_number_of_times_bot_plays > 4:
		if number_of_bot_played < number_of_time_bot_plays:
			var waiting_timer = Timer.new()
			waiting_timer.set_wait_time(1)
			waiting_timer.set_one_shot(false)
			call_deferred("add_child", waiting_timer)
			waiting_timer.set_autostart(true)
			yield(waiting_timer, "timeout")
			sound_bot_color = Global.global_guard_number[0]
		if number_of_bot_played == number_of_time_bot_plays:
			var waiting_timer = Timer.new()
			waiting_timer.set_wait_time(1)
			waiting_timer.set_one_shot(false)
			call_deferred("add_child", waiting_timer)
			waiting_timer.set_autostart(true)
			yield(waiting_timer, "timeout")
			sound_bot_color = forms[0]

	if sound_bot_color == 1:
		if not get_node("Button_1_Sound").is_playing():
			get_node("Button_1_Sound").play()
	if sound_bot_color == 2:
		if not get_node("Button_2_Sound").is_playing():
			get_node("Button_2_Sound").play()
	if sound_bot_color == 3:
		if not get_node("Button_3_Sound").is_playing():
			get_node("Button_3_Sound").play()
	if sound_bot_color == 4:
		if not get_node("Button_4_Sound").is_playing():
			get_node("Button_4_Sound").play()

func check_bot_finish():
	if Global.global_number_of_times_bot_plays <= 4:
		player_can_play = true
	if Global.global_number_of_times_bot_plays > 4:
		var waiting_timer = Timer.new()
		waiting_timer.set_wait_time(3)
		waiting_timer.set_one_shot(false)
		call_deferred("add_child", waiting_timer)
		waiting_timer.set_autostart(true)
		yield(waiting_timer, "timeout")
		player_can_play = true
	if player_can_play == true:
			get_node("Bot_Color_1").visible = false
			get_node("Button_1").disabled = false
			get_node("Button_2").disabled = false
			get_node("Button_3").disabled = false
			get_node("Button_4").disabled = false

func press_button():
	if get_node("Button_1").pressed == true and can_click == true:
		can_click = false
		if not get_node("Button_Animation").is_playing():
			get_node("Button_Animation").play("button_1_animation")
		if not get_node("Button_1_Sound").is_playing():
			get_node("Button_1_Sound").play()
			var waiting_timer = Timer.new()
			waiting_timer.set_wait_time(1)
			waiting_timer.set_one_shot(true)
			call_deferred("add_child", waiting_timer)
			waiting_timer.set_autostart(true)
			yield(waiting_timer, "timeout")
			get_node("Button_1_Sound").stop()
		your_information_pressed.append(1)
		var waiting_timer = Timer.new()
		waiting_timer.set_wait_time(0.5)
		waiting_timer.set_one_shot(true)
		call_deferred("add_child", waiting_timer)
		waiting_timer.set_autostart(true)
		yield(waiting_timer, "timeout")
		can_click = true

	if get_node("Button_2").pressed == true and can_click == true:
		can_click = false
		if not get_node("Button_Animation").is_playing():
			get_node("Button_Animation").play("button_2_animation")
		if not get_node("Button_2_Sound").is_playing():
			get_node("Button_2_Sound").play()
			var waiting_timer = Timer.new()
			waiting_timer.set_wait_time(1)
			waiting_timer.set_one_shot(true)
			call_deferred("add_child", waiting_timer)
			waiting_timer.set_autostart(true)
			yield(waiting_timer, "timeout")
			get_node("Button_2_Sound").stop()
		your_information_pressed.append(2)
		var waiting_timer = Timer.new()
		waiting_timer.set_wait_time(0.5)
		waiting_timer.set_one_shot(true)
		call_deferred("add_child", waiting_timer)
		waiting_timer.set_autostart(true)
		yield(waiting_timer, "timeout")
		can_click = true

	if get_node("Button_3").pressed == true and can_click == true:
		can_click = false
		if not get_node("Button_Animation").is_playing():
			get_node("Button_Animation").play("button_3_animation")
		if not get_node("Button_3_Sound").is_playing():
			get_node("Button_3_Sound").play()
			var waiting_timer = Timer.new()
			waiting_timer.set_wait_time(1)
			waiting_timer.set_one_shot(true)
			call_deferred("add_child", waiting_timer)
			waiting_timer.set_autostart(true)
			yield(waiting_timer, "timeout")
			get_node("Button_3_Sound").stop()
		your_information_pressed.append(3)
		var waiting_timer = Timer.new()
		waiting_timer.set_wait_time(0.5)
		waiting_timer.set_one_shot(true)
		call_deferred("add_child", waiting_timer)
		waiting_timer.set_autostart(true)
		yield(waiting_timer, "timeout")
		can_click = true

	if get_node("Button_4").pressed == true and can_click == true:
		can_click = false
		if not get_node("Button_Animation").is_playing():
			get_node("Button_Animation").play("button_4_animation")
		if not get_node("Button_4_Sound").is_playing():
			get_node("Button_4_Sound").play()
			var waiting_timer = Timer.new()
			waiting_timer.set_wait_time(1)
			waiting_timer.set_one_shot(true)
			call_deferred("add_child", waiting_timer)
			waiting_timer.set_autostart(true)
			yield(waiting_timer, "timeout")
			get_node("Button_4_Sound").stop()
		your_information_pressed.append(4)
		var waiting_timer = Timer.new()
		waiting_timer.set_wait_time(0.5)
		waiting_timer.set_one_shot(true)
		call_deferred("add_child", waiting_timer)
		waiting_timer.set_autostart(true)
		yield(waiting_timer, "timeout")
		can_click = true

func _on_Button_Sair_pressed():
	if not get_node("Button_Animation").is_playing():
		get_node("Button_Animation").play("button_sair")
	if not get_node("Button_Sair_Audio").is_playing():
		get_node("Button_Sair_Audio").play()
	var waiting_timer = Timer.new()
	waiting_timer.set_wait_time(0.7)
	waiting_timer.set_one_shot(true)
	call_deferred("add_child", waiting_timer)
	waiting_timer.set_autostart(true)
	yield(waiting_timer, "timeout")
	get_tree().quit()

func check_information():
	while your_information_pressed.size() < guard_information.size():
		return

	if guard_information.size() == your_information_pressed.size():
		if guard_information == your_information_pressed:
			get_node("Button_1").disabled = false
			get_node("Button_2").disabled = false
			get_node("Button_3").disabled = false
			get_node("Button_4").disabled = false
			check_level()
		else:
			game_over()

func check_level():
	if Global.global_number_of_times_bot_plays < 30:
		var waiting_timer = Timer.new()
		waiting_timer.set_wait_time(1)
		waiting_timer.set_one_shot(true)
		call_deferred("add_child", waiting_timer)
		waiting_timer.set_autostart(true)
		yield(waiting_timer, "timeout")
		if not get_node("Sequencia_Certa").is_playing() and can_play_correct == true:
			get_node("Sequencia_Certa").play()
			can_play_correct = false
		var waiting_timer_2 = Timer.new()
		waiting_timer_2.set_wait_time(3)
		waiting_timer_2.set_one_shot(true)
		call_deferred("add_child", waiting_timer_2)
		waiting_timer_2.set_autostart(true)
		yield(waiting_timer_2, "timeout")
		Global.global_number_of_times_bot_plays += 1
		get_tree().call_deferred("change_scene","res://Scenes/Transition_Preparado.tscn")

	if Global.global_number_of_times_bot_plays >= 30:
		get_tree().call_deferred("change_scene","res://Scenes/Transition_Parabens.tscn")

func game_over():
	var waiting_timer = Timer.new()
	waiting_timer.set_wait_time(1)
	waiting_timer.set_one_shot(true)
	call_deferred("add_child", waiting_timer)
	waiting_timer.set_autostart(true)
	yield(waiting_timer, "timeout")
	if not get_node("Sequencia_Errada").is_playing() and can_play_wrong == true:
		get_node("Sequencia_Errada").play()
		can_play_wrong = false
	Global.global_number_of_times_bot_plays = 4
	var waiting_timer_2 = Timer.new()
	waiting_timer_2.set_wait_time(2)
	waiting_timer_2.set_one_shot(true)
	call_deferred("add_child", waiting_timer_2)
	waiting_timer_2.set_autostart(true)
	yield(waiting_timer_2, "timeout")
	get_tree().call_deferred("change_scene","res://Scenes/Transition_Errou.tscn")
