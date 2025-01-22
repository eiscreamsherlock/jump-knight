extends Node2D

const SPEED = 60 # put your variables at the top of the script like a smart person

var direction = 1
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _process(delta: float) -> void:
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite.flip_h = true
	if ray_cast_left.is_colliding():
		animated_sprite.flip_h = false
		direction = 1
	# mult by delta so that we move at a fix rate
	position.x += direction * SPEED * delta
