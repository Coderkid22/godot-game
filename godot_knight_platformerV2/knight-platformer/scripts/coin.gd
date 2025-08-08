extends Area2D

var score



func _on_body_entered(_body: Node2D) -> void: # click node, click NODE tab on left, double click
	#wanted signal
	queue_free()# basically deletes thing
	score += 64
	
