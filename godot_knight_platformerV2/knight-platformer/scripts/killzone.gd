extends Area2D

@onready var timer: Timer = $Timer # ctrl hold for auto path/var to node 

func _on_body_entered(_body: Node2D) -> void: # signal from node 
	# (click node goto node tab double clikc to connect)
	timer.start()



func _on_timer_timeout() -> void: #signal
	get_tree().reload_current_scene()# resets game
