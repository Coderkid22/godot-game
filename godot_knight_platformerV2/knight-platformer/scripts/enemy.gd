extends Node2D

const SPEED = 55 # cosnt means constant so it doesnt change
var direction = 1

#raycasts
@onready var ray_cast_left_down: RayCast2D = $RayCastLeftDown
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_right_down: RayCast2D = $RayCastRightDown
@export_enum("Green", "Purple")
var color: int

#other
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@export var slime_color: bool

func _ready() -> void:
	
	
	if slime_color:
		animated_sprite_2d.animation = "new_animation"
	else:
		animated_sprite_2d.animation = "default"


func turn_around():
	direction *= -1
	# Flip the animated sprite
	animated_sprite_2d.flip_h = direction < 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
 # delta makes sure stuff changes at the same rate over differnet fps eg. lag
func _process(delta: float) -> void:
	
	if ray_cast_right.is_colliding():
		turn_around()
	if ray_cast_left.is_colliding():
		turn_around()
	if not ray_cast_left_down.is_colliding(): #block infornt
		turn_around()
	if not ray_cast_right_down.is_colliding():
		turn_around()
		
	position.x += direction * SPEED * delta
