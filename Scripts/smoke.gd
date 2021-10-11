extends Sprite


func _ready():
	pass

func _process(delta):
	position.y -= 2

func _on_AnimationPlayer_animation_finished(anim_name):
	self.queue_free()
