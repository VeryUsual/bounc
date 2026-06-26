extends Node2D

func _ready() -> void:
	remake_circle(170)

func wait_and_remake_circle(radius, wait_time):
	await get_tree().create_timer(wait_time).timeout
	remake_circle(radius)

func remake_circle(radius):
	var centre = $Centre.position
	var amount_of_players = $Bots.get_child_count() + 1
	var positions = []
	for i in range(amount_of_players):
		var a = (2 * PI * i) / amount_of_players + PI/2
		var x = centre.x + radius * cos(a)
		var y = centre.y + radius * sin(a)
		positions.append(Vector2(x, y))
	
	$Player.position = positions[0]
	$Player.rotation = (centre - positions[0]).angle() + PI/2
	var i = 1
	for b in $Bots.get_children():
		b.position = positions[i]
		b.rotation = (centre - positions[i]).angle() + PI/2
		i += 1

func _process(delta: float) -> void:
	if $Bots.get_child_count() == 0:
		print("You won!")
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
