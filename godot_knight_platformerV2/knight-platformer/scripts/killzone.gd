extends Area2D

@onready var timer: Timer = $Timer # ctrl hold for auto path/var to node 

func _on_body_entered(body: Node2D) -> void: # signal from node 
	# (click node goto node tab double clikc to connect)
	
	Engine.time_scale = 0.67
	body.get_node("CollisionShape2D").queue_free()

	
	timer.start()




func _on_timer_timeout() -> void: #signal
	
	Engine.time_scale = 1
	
	get_tree().reload_current_scene()# resets game
