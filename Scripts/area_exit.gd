extends Area2D
class_name AreaExit

@export var sprite: Sprite2D
var is_open = false

func _ready() -> void:
	close_portal()

func _on_body_entered(body: Node2D) -> void:
	if is_open && body is PlayerController:
		GameManager.next_area()
		
func open_portal():
	is_open = true
	sprite.region_rect.position.x = 22
	
func close_portal():
	is_open = false
	sprite.region_rect.position.x = 0
