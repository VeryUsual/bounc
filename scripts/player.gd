extends Node2D

const SPEED = 130

func _physics_process(delta: float) -> void:
	var dir = Input.get_axis("move_left", "move_right")
	$CharacterBody2D.velocity = Vector2(dir * SPEED, 0)
	$CharacterBody2D.move_and_slide()

func _on_score_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("ball"):
		modulate.a = 0.6
		
		var tween = create_tween()
		tween.tween_property(self, "modulate:a", 0.0, 0.5)
		
		await get_tree().create_timer(0.5).timeout
		
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
