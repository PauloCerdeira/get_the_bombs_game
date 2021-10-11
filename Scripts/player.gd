extends KinematicBody2D

export var speed = 300
#importar o sprite para facilitar
onready var spr_player = $Sprite

func _ready():
	pass

func _process(_delta):

	var dir = Vector2(0,0)
	
	if Input.is_action_pressed("left"):
		#get_node("Sprite").flip_h = true
		$CollisionShape2D.position.x = -23.784
		spr_player.flip_h = true
		dir.x = -1
	if Input.is_action_pressed("right"):
		#$Sprite.flip_h = false
		$CollisionShape2D.position.x = 23.784
		spr_player.flip_h = false
		dir.x = 1
	
	if self.position.x <= 58:
		self.position.x = 58
	elif self.position.x >= 456:
		self.position.x = 456
		
	move_and_slide(dir * speed)
