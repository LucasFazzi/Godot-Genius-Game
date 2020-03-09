extends Node2D

var forms = [1,2,3,4]
var array_number_of_time_bot_plays = []
var number_of_time_bot_plays
var number_of_bot_played = 0
var guard_information = []
var can_click = true
var player_can_play = false
var your_information_pressed = []

func _ready():
	disable_buttons()
	randomic_start()
	start_bot_play()

func _process(delta):
	press_button()
	check_information()

func randomic_start():
	array_number_of_time_bot_plays.resize(Global.global_number_of_times_bot_plays)
	number_of_time_bot_plays = array_number_of_time_bot_plays.size()
	randomize()
	forms.shuffle()

func disable_buttons():
		get_node("Bot_Color_1").visible = false
		get_node("Bot_Color_2").visible = false
		get_node("Bot_Color_3").visible = false
		get_node("Bot_Color_4").visible = false

func start_bot_play():
	while number_of_bot_played < number_of_time_bot_plays:
		print ("forms",forms[0])
		guard_information.append(forms[0])
		check_button_color()
		var waiting_timer = Timer.new()
		waiting_timer.set_wait_time(4)
		waiting_timer.set_one_shot(false)
		call_deferred("add_child", waiting_timer)
		waiting_timer.set_autostart(true)
		yield(waiting_timer, "timeout")
		forms.shuffle()
		number_of_bot_played += 1
	if number_of_bot_played >= number_of_time_bot_plays:
		print ("guard_information", guard_information)
		check_bot_finish()

func check_button_color():
	if forms[0] == 1:
		get_node("Bot_Color_1").visible = true
		var waiting_timer = Timer.new()
		waiting_timer.set_wait_time(2)
		waiting_timer.set_one_shot(false)
		call_deferred("add_child", waiting_timer)
		waiting_timer.set_autostart(true)
		yield(waiting_timer, "timeout")
		get_node("Bot_Color_1").visible = false
		pass
	if forms[0] == 2:
		get_node("Bot_Color_2").visible = true
		var waiting_timer = Timer.new()
		waiting_timer.set_wait_time(2)
		waiting_timer.set_one_shot(false)
		call_deferred("add_child", waiting_timer)
		waiting_timer.set_autostart(true)
		yield(waiting_timer, "timeout")
		get_node("Bot_Color_2").visible = false
		pass
	if forms[0] == 3:
		get_node("Bot_Color_3").visible = true
		var waiting_timer = Timer.new()
		waiting_timer.set_wait_time(2)
		waiting_timer.set_one_shot(false)
		call_deferred("add_child", waiting_timer)
		waiting_timer.set_autostart(true)
		yield(waiting_timer, "timeout")
		get_node("Bot_Color_3").visible = false
		pass
	if forms[0] == 4:
		get_node("Bot_Color_4").visible = true
		var waiting_timer = Timer.new()
		waiting_timer.set_wait_time(2)
		waiting_timer.set_one_shot(false)
		call_deferred("add_child", waiting_timer)
		waiting_timer.set_autostart(true)
		yield(waiting_timer, "timeout")
		get_node("Bot_Color_4").visible = false
		pass

func check_bot_finish():
	guard_information_process()
	print ("bot finish")
	player_can_play = true
	if player_can_play == true:
		get_node("Button_1").disabled = false
		get_node("Button_2").disabled = false
		get_node("Button_3").disabled = false
		get_node("Button_4").disabled = false
	pass

func guard_information_process():
	pass

func press_button():
	if get_node("Button_1").pressed == true and can_click == true:
		print ("button 1")
		your_information_pressed.append(1)
		print("your information",your_information_pressed)
		can_click = false
		var waiting_timer = Timer.new()
		waiting_timer.set_wait_time(0.2)
		waiting_timer.set_one_shot(true)
		call_deferred("add_child", waiting_timer)
		waiting_timer.set_autostart(true)
		yield(waiting_timer, "timeout")
		can_click = true
	if get_node("Button_2").pressed == true and can_click == true:
		print ("button 2")
		your_information_pressed.append(2)
		print("your information",your_information_pressed)
		can_click = false
		var waiting_timer = Timer.new()
		waiting_timer.set_wait_time(0.2)
		waiting_timer.set_one_shot(true)
		call_deferred("add_child", waiting_timer)
		waiting_timer.set_autostart(true)
		yield(waiting_timer, "timeout")
		can_click = true
	if get_node("Button_3").pressed == true and can_click == true:
		print ("button 3")
		your_information_pressed.append(3)
		print("your information",your_information_pressed)
		can_click = false
		var waiting_timer = Timer.new()
		waiting_timer.set_wait_time(0.2)
		waiting_timer.set_one_shot(true)
		call_deferred("add_child", waiting_timer)
		waiting_timer.set_autostart(true)
		yield(waiting_timer, "timeout")
		can_click = true
	if get_node("Button_4").pressed == true and can_click == true:
		print ("button 4")
		your_information_pressed.append(4)
		print("your information",your_information_pressed)
		can_click = false
		var waiting_timer = Timer.new()
		waiting_timer.set_wait_time(0.2)
		waiting_timer.set_one_shot(true)
		call_deferred("add_child", waiting_timer)
		waiting_timer.set_autostart(true)
		yield(waiting_timer, "timeout")
		can_click = true

func check_information():
	while your_information_pressed.size() < guard_information.size():
		return

	if guard_information.size() == your_information_pressed.size():
		if guard_information == your_information_pressed:
			check_level()
		else:
			print ("wrong")
			game_over()

func check_level():
	var waiting_timer = Timer.new()
	waiting_timer.set_wait_time(2)
	waiting_timer.set_one_shot(true)
	call_deferred("add_child", waiting_timer)
	waiting_timer.set_autostart(true)
	yield(waiting_timer, "timeout")
	Global.global_number_of_times_bot_plays += 1
	get_tree().reload_current_scene()

func game_over():
	var waiting_timer = Timer.new()
	waiting_timer.set_wait_time(2)
	waiting_timer.set_one_shot(true)
	call_deferred("add_child", waiting_timer)
	waiting_timer.set_autostart(true)
	yield(waiting_timer, "timeout")
	Global.global_number_of_times_bot_plays = 4
	get_tree().reload_current_scene()
