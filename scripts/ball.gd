extends CharacterBody2D

const SPEED = 300
const BOUNCE_FORCE = 500
var direction = Vector2.DOWN

func _physics_process(delta: float) -> void:
	if global_position.distance_to(get_tree().current_scene.get_node("Centre").global_position) > 240:
		direction = -direction.rotated(deg_to_rad(randf_range(-20, 20)))
		reset()
	
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
	var old_dir = direction
	if get_tree().current_scene.get_node("Bots").get_child_count() == 1:
		old_dir = Vector2.DOWN
	await get_tree().create_timer(0.2).timeout
	direction = Vector2.ZERO
	global_position = get_tree().current_scene.get_node("Centre").global_position
	direction = old_dir
	await get_tree().process_frame
	direction = Vector2.ZERO
	await get_tree().create_timer(0.7).timeout
	direction = old_dir
	
