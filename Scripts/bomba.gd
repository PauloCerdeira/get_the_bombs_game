extends Area2D

var pre_smoke = preload("res://Scenes/smoke.tscn")
var timer_smoke = 0

var pre_smokeOut = preload("res://Scenes/smokeOut.tscn")

var pre_explosao = preload("res://Scenes/explosao.tscn")

export var vel = 100

func _ready():
	pass

func _process(_delta):
	#tempo para instanciar a fumaça
	timer_smoke += _delta
	if timer_smoke > rand_range(0.1, 0.2):
		criarSmoke()
		timer_smoke = 0
	
	vel += 3
	self.position.y += vel * _delta
	if self.position.y > 700:
		self.queue_free()


func _on_bomba_body_entered(body):
	if body.name == "player":
		get_parent().pontos += 10
		criarSmokeOut()
		self.queue_free()
	


func _on_bomba_area_entered(area):
	if area.name == "chao":
		var parent = get_parent()
		parent.vidas -= 1
		if parent.vidas == 2:
			parent.get_node('heart3').queue_free()
		elif parent.vidas == 1:
			parent.get_node('heart2').queue_free()
		elif parent.vidas == 0:
			parent.get_node('heart').queue_free()
		criarExplosao()
		self.queue_free()

func criarSmoke():
	var smoke = pre_smoke.instance()
	smoke.position = self.position + Vector2(rand_range(-15,-20),-20)
	get_parent().add_child(smoke)

func criarSmokeOut():
	var smokeOut = pre_smokeOut.instance()
	smokeOut.position = self.position
	get_parent().add_child(smokeOut)

func criarExplosao():
	var explosao = pre_explosao.instance()
	explosao.position = self.position
	get_parent().add_child(explosao)
