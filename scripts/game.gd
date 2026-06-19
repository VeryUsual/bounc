extends Node2D

func _process(delta: float) -> void:
	if $Bots.get_child_count() == 0:
		print("You won!")
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
