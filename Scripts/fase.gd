extends Node2D

var pre_bomba = preload("res://Scenes/bomba.tscn")
var tempo = 0
export var intervalo_min = 0.6
export var intervalo_max = 1.2

#sistema de pontos
export var pontos = 0
onready var label = $Label

#sistema de vidas
export var vidas = 3
var alive = true
onready var gameOverLabel = $Label2

func _ready():
	pass

func _physics_process(delta):
	if (alive):
		label.text = "Pontos: " + str(pontos)
		
		tempo += delta

		if tempo > rand_range(intervalo_min, intervalo_max):
			criarBomba()
			tempo = 0
		
		if (vidas <= 0):
			gameOver()
	else:
		if Input.is_action_pressed("restart"):
			get_tree().change_scene("res://Scenes/fase.tscn")

func criarBomba():
	var bomba = pre_bomba.instance()
	bomba.position = Vector2(rand_range(65, 440), 0)
	self.add_child(bomba)

func gameOver():
	alive = false
	$player.queue_free()
	gameOverLabel.text = 'FIM DE JOGO \n\n pressione "r" para recomeçar!'
