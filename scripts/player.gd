extends Node2D

const SPEED = 130

func _physics_process(delta: float) -> void:
	var dir = Input.get_axis("move_left", "move_right")
	$CharacterBody2D.velocity = Vector2(dir * SPEED, 0)
	$CharacterBody2D.move_and_slide()
