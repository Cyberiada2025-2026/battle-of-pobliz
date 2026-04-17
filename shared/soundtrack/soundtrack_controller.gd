extends Node

var current_scene = 0

var current_boss_phase = 0
# 0 is main menu
# 1 is pause menu
# 2 is bossfight  

var main_loop_player : AudioStreamPlayer
# var menu_loop_player : AudioStreamPlayer = get_child(1)

var main_loop_playback : AudioStreamPlaybackInteractive

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !main_loop_player && current_scene == 2:
		main_loop_player = get_child(0)
		main_loop_playback = main_loop_player.get_stream_playback()
	elif main_loop_player:
		# Mute/Unmute music if in pause:
		if current_scene == 1:
			main_loop_player.volume_db = -6
		else:
			main_loop_player.volume_db = 0
			
		# Advance music through phases
		if current_boss_phase < 2 && main_loop_playback.get_current_clip_index() != 0:
			main_loop_playback.switch_to_clip(0)
		elif current_boss_phase >= 2 && main_loop_playback.get_current_clip_index() != 1:
			main_loop_playback.switch_to_clip(1)
