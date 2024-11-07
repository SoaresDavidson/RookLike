extends Node2D

var coordinates:Array
const DISTANCE = Global.DISTANCE
const ORIGIN = Global.ORIGIN

var Bishop:PackedScene = preload("res://Scenes/Pieces/bishop.tscn")
var Knight:PackedScene = preload("res://Scenes/Pieces/knight.tscn")
var King:PackedScene = preload("res://Scenes/Pieces/king.tscn")
var Queen:PackedScene = preload("res://Scenes/Pieces/queen.tscn")
var Rook:PackedScene = preload("res://Scenes/Pieces/rook.tscn")
var Pawn:PackedScene = preload("res://Scenes/Pieces/pawn.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(8):
		var coords:Array
		for j in range(8):
			var pos = Vector2(ORIGIN.x + DISTANCE * j, ORIGIN.y + DISTANCE * i)
			coords.append(pos)
		coordinates.append(coords)
	Global.coordinates = coordinates
	spawnWhitePieces()

func spawnWhitePieces():
	var coordsPawns = coordinates[6]
	var coordsPieces = coordinates[7]
	var pieceObjects = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]
	for i in coordsPawns:
		$InstantiatePieces.spawn(Pawn, i)
	for i in range(8):
		$InstantiatePieces.spawn(pieceObjects[i], coordsPieces[i])

func spawnBishop():
	$InstantiatePieces.spawn(Bishop)
	
func spawnRook():
	$InstantiatePieces.spawn(Bishop)
	
func spawnQueen():
	$InstantiatePieces.spawn(Bishop)
	
func spawnKnight():
	$InstantiatePieces.spawn(Bishop)
	
func spawnKing():
	$InstantiatePieces.spawn(Bishop)
	
func spawnPawn():
	$InstantiatePieces.spawn(Bishop)
