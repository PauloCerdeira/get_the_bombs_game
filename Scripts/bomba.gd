extends Area2D

export var vel = 100

func _ready():
	pass

func _process(_delta):
	vel += 3
	self.position.y += vel * _delta
	if self.position.y > 700:
		self.queue_free()


func _on_bomba_body_entered(body):
	if body.name == "player":
		get_parent().pontos += 10
		self.queue_free()
	


func _on_bomba_area_entered(area):
	print(area.name)
	if area.name == "chao":
		get_parent().vidas -= 1
		self.queue_free()
