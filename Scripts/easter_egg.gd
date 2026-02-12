extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body is PlayerController:
		$Sprite2D.hide()
		await get_tree().create_timer(0.75).timeout
		queue_free()
