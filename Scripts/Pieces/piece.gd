extends Node2D
class_name Piece

var moves = 0
var draggable = false
var body_ref = null
var bodies
#var offset:Vector2
var initialPos:Vector2
signal dragging

const DISTANCE = Global.DISTANCE

func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	if draggable:
		if Input.is_action_just_pressed("click"):
			initialPos = global_position
			#offset = get_global_mouse_position() - global_position
			Global.is_dragging = true
			emit_signal("dragging")
		if Input.is_action_pressed("click"):
			global_position = get_global_mouse_position()
		elif Input.is_action_just_released("click"):
			Global.is_dragging = false
			var tween = get_tree().create_tween()
			
			if body_ref:
				tween.tween_property(self, "position", body_ref.position,0.2).set_ease(Tween.EASE_OUT)
				moves += 1
				await tween.step_finished
				updatePosition()
			else:
				tween.tween_property(self, "global_position", initialPos,0.2).set_ease(Tween.EASE_OUT)
			#body_ref = null
	
	bodies = $Area2D.get_overlapping_bodies()
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("dropable"):
		bodies = $Area2D.get_overlapping_bodies()
		for i in bodies.size():
			if i == bodies.size()-1:
				bodies[i].modulate = Color(Color.RED, 1)
				body_ref = bodies[i]
			else:
				bodies[i].modulate = Color(Color.SLATE_GRAY, 0.7)
		
func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("dropable"):
		body.modulate = Color(Color.SLATE_GRAY, 0.7)
		if not $Area2D.has_overlapping_bodies():
			body_ref = null
	
func _on_area_2d_mouse_entered() -> void:
	if not Global.is_dragging:
		draggable = true
		scale = Vector2(1.1, 1.1)
		
func _on_area_2d_mouse_exited() -> void:
	if not Global.is_dragging:
		draggable = false
		scale = Vector2(1.0, 1.0)
		

func inBoard(boardPosition:Vector2) -> bool:
	return boardPosition.x < 556 and boardPosition.x > 44 and boardPosition.y < 553 and  boardPosition.y > 41 
	
func bishopMove() -> void:
	for i in [DISTANCE, -DISTANCE]:
		for j in range(1,8):
			var positionx = initialPos.x+i*j
			var positiony = initialPos.y+i*j
			if inBoard(Vector2(positionx, positiony)): $Instantiator.spawn(Vector2(positionx, positiony))
			positiony = initialPos.y-i*j
			if inBoard(Vector2(positionx, positiony)): $Instantiator.spawn(Vector2(positionx, positiony))
			
func knightMove() -> void:
	for i in [DISTANCE,-DISTANCE]:
		for j in [DISTANCE*2,-DISTANCE*2]:
			var Position = Vector2(initialPos.x+i,initialPos.y-j)
			var Position2 = Vector2(initialPos.x+j,initialPos.y-i)
			if inBoard(Position) : $Instantiator.spawn(Position)
			if inBoard(Position2) : $Instantiator.spawn(Position2)

func rookMove() -> void:
	for i in [DISTANCE,-DISTANCE]:
		for j in range(1,8):
			var positionx = initialPos.x+i*j
			var positiony = initialPos.y
			if inBoard(Vector2(positionx, positiony)): $Instantiator.spawn(Vector2(positionx, positiony))
			
			positionx = initialPos.x
			positiony = initialPos.y+i*j
			if inBoard(Vector2(positionx, positiony)): $Instantiator.spawn(Vector2(positionx, positiony))

func positionToNotation(pos:Vector2):
	var letter = int(pos.x - 42) % 8
	var number = int(pos.y - 42) % 8 
	return [letter, number]

func updatePosition():
	var pos = positionToNotation(global_position)
	var previousPos = positionToNotation(initialPos)
	print(previousPos)
	print(pos)
	
	Global.board[pos[0]][pos[1]] = self
	Global.board[previousPos[0]][previousPos[1]] = null
	print(Global.board)
	
	
	
