extends Node2D

var characters 

#button presed to create server
func _on_host() -> void:
	MultiplayerManager.become_host($MultiplayerSpawner)
	#$Camera2D.queue_free()
	%HUD.visible = false
	

# button pressed to join server
func _on_join() -> void:
	MultiplayerManager.join()
	%HUD.visible = false
