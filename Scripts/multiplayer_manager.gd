extends Node

const IP_ADDR = "127.0.0.1"
const PORT = 8080
const MAX_CLIENT = 32
var player_spawner : MultiplayerSpawner
var spawn_node :Node
var players := preload("res://guy.tscn")

func become_host( spawner : MultiplayerSpawner ):
	var peer = ENetMultiplayerPeer.new()
	peer.create_server(PORT,MAX_CLIENT)
	multiplayer.multiplayer_peer = peer
	spawn_node = get_tree().get_current_scene().get_node("Players")
	# Sets up the spawner on the server
	player_spawner = spawner
	
	multiplayer.peer_connected.connect(_peer_connected)
	multiplayer.peer_disconnected.connect(_peer_disconnect)
	
func join():
	var peer = ENetMultiplayerPeer.new()
	peer.create_client(IP_ADDR,PORT)
	print("something")
	multiplayer.multiplayer_peer = peer
	
	


func _peer_connected(id: int):
	var player = players.instantiate()
	spawn_node.add_child(player)
	player.id = id
	player.name = str(id)
	
	print("Player %d connected" % id)

func _peer_disconnect(id:int):
	print("Player %d connected" % id)
	
	
