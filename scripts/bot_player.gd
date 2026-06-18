extends Node2D

const SPEED = 110

var going = "right"
var going_for = 50

func _physics_process(delta: float) -> void:
	if going_for > 0:
		var dir
		if going == "right":
			dir = Vector2.RIGHT.rotated(rotation)
		elif going == "left":
			dir = Vector2.LEFT.rotated(rotation)
		$CharacterBody2D.velocity = dir * SPEED
		$CharacterBody2D.move_and_slide()
		going_for -= 1
	else:
		if randf() < 0.5:
			going = "right"
		else:
			going = "left"
		going_for = 50

func _on_score_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("ball"):
		await get_tree().create_timer(0.2).timeout
		queue_free()
