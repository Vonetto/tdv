extends Node2D

var timer_duration: float = 60.0
var current_time: float = 0.0
var print_timer: Timer
@onready var timeText = get_node("timeText")

#blue pieces
@onready var instancedWPawn = preload("res://Fight_Pieces/Blue_Pieces/Blue_Pawn/blue_pawn.tscn")
@onready var instancedWRook = preload("res://Fight_Pieces/Blue_Pieces/Blue_Rook/blue_rock.tscn")
@onready var instancedWKnight = preload("res://Fight_Pieces/Blue_Pieces/Blue_Knight/blue_knight.tscn")
@onready var instancedWBishop = preload("res://Fight_Pieces/Blue_Pieces/Blue_Bishop/blue_bishop.tscn")
@onready var instancedWQueen = preload("res://Fight_Pieces/Blue_Pieces/Blue_Queen/blue_queen.tscn")
@onready var instancedWKing = preload("res://Fight_Pieces/Blue_Pieces/Blue_King/blue_king.tscn")

#red pieces
@onready var instancedBPawn = preload("res://Fight_Pieces/Red_Pieces/Red_Pawn/red_pawn.tscn")
@onready var instancedBRook = preload("res://Fight_Pieces/Red_Pieces/Red_Rook/red_rook.tscn")
@onready var instancedBKnight = preload("res://Fight_Pieces/Red_Pieces/Red_Knight/red_knight.tscn")
@onready var instancedBBishop = preload("res://Fight_Pieces/Red_Pieces/Red_Bishop/red_bishop.tscn")
@onready var instancedBQueen = preload("res://Fight_Pieces/Red_Pieces/Red_Queen/red_queen.tscn")
@onready var instancedBKing = preload("res://Fight_Pieces/Red_Pieces/Red_King/red_king.tscn")

func _ready():
	print_timer = Timer.new()
	print_timer.wait_time = 1.0
	print_timer.one_shot = false
	print_timer.timeout.connect(_printTimeLeft)
	add_child(print_timer)

	startTimer()

func _instance_ficha(ficha, pos):
	var Player = ficha.instantiate()
	add_child(Player)
	Player.position = pos

func _on_fight_started(ficha1, ficha2):
	var J1 = ficha1
	var J2 = ficha2
	var Player = null
	var pos = null
	for ficha in [J1, J2]:
		var team = ficha.ficha["team"]
		var id = ficha.ficha["id"]
		#equipos
		if team == "White":
			pos = Vector2(530, 524)
			if id == "P":
				Player = instancedWPawn
			elif id == "R":
				Player = instancedWRook
			elif id == "N":
				Player = instancedWKnight
			elif id == "B":
				Player = instancedWBishop
			elif id == "Q":
				Player = instancedWQueen
			elif id == "K":
				Player = instancedWKing
		elif team == "Black":
			pos = Vector2(530, 524)
			if id == "P":
				Player = instancedWPawn
			elif id == "R":
				Player = instancedWRook
			elif id == "N":
				Player = instancedWKnight
			elif id == "B":
				Player = instancedWBishop
			elif id == "Q":
				Player = instancedWQueen
			elif id == "K":
				Player = instancedWKing
		_instance_ficha(Player, pos)

func startTimer():
	current_time = timer_duration
	print_timer.start()

func _printTimeLeft():
	print("Time left:", current_time)
	timeText.text = "Time Left: " + str(current_time)
	current_time -= 1.0
	if current_time < 0:
		print_timer.stop()
		print("Timer expired!")
		# Perform your desired actions here
