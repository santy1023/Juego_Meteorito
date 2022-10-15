class_name SectorMeteoritos
extends Node2D

## Atributos export
export var cantidad_meteoritos:int = 10

## Atributos
var spawners:Array

## Metodos
func _ready() -> void:
	almacenar_spawners()

## Metodos Custom
func almacenar_spawners() -> void:
	for spawner in $Spawners.get_children():
		spawners.append(spawner)

func spawner_aleatorio() -> int:
	randomize()
	return randi() % spawners.size()

## Señales Internas
func _on_SpawnTimer_timeout() -> void:
	if cantidad_meteoritos == 0:
		$SpawnTimer.stop()
		return
	spawners[spawner_aleatorio()].spawnear_meteorito()
	cantidad_meteoritos -= 1
