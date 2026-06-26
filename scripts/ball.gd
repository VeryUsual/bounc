extends CharacterBody2D

const SPEED = 300
const BOUNCE_FORCE = 500
var direction = Vector2.DOWN

func _physics_process(delta: float) -> void:
	if global_position.distance_to(get_tree().current_scene.get_node("Centre").global_position) > 240:
		direction = -direction
	
	velocity = direction * SPEED
	move_and_slide()
	
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		direction = direction.bounce(collision.get_normal())
		direction = direction.rotated(deg_to_rad(randf_range(-20, 20)))
		velocity = direction * BOUNCE_FORCE

func _ready() -> void:
	velocity = direction * SPEED

func reset():
	velocity = Vector2.ZERO
	global_position = get_tree().current_scene.get_node("Centre").global_position
	await get_tree().create_timer(0.1).timeout
	velocity = direction * SPEED
