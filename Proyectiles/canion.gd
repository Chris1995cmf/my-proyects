class_name canion
extends Node2D

## ATRIBUTOS EXPORT
export var proyectil:PackedScene = null
export var cadencia_disparo:float = 0.8
export var velocidad_proyectil:int = 100
export var danio_proyectil:int = 1

## ATRIBUTOS ONREADY
onready var timer_enfriamiento:Timer = $TimerEnfriamiento
onready var disparo_sfx:AudioStreamPlayer2D = $DisparosSFX
onready var esta_enfriado:bool = true
onready var esta_disparando:bool = false setget set_esta_disparando

## ATRIBUTOS
var puntos_disparo:Array = []

## SETTERS Y GETTERS
func set_esta_disparando (disparando: bool) -> void:
	esta_disparando = disparando

## METODOS
func _ready()->void :
	almacenar_puntos_disparo()
	timer_enfriamiento.wait_time = cadencia_disparo

func _process(_delta: float)-> void:
	if esta_disparando and esta_enfriado:
		disparar()

func disparar() -> void:
	esta_enfriado = false
	disparo_sfx.play()
	timer_enfriamiento.start()
	for punto_disparo in puntos_disparo:
		var new_proyectil:proyectil = proyectil.instance()
		new_proyectil.crear(
			punto_disparo.global_position,
			get_owner().rotation,
			velocidad_proyectil,
			danio_proyectil
		)
		EventoDisparos.emit_signal("disparo", new_proyectil)
		disparo_sfx.play()

## COSTRUCTOR
#func crear (pos: Vector2, dir: float, vel: float, danio_p: int) -> void:
#	position = pos
#	rotation = dir
#	velocidad = Vector2(vel , 0).rotated(dir)
#	danio = danio_p

## METODOS CUSTOM
func almacenar_puntos_disparo() -> void:
	for nodo in get_children():
		if nodo is Position2D:
			puntos_disparo.append(nodo)



func _on_TimerEnfriamiento_timeout()-> void:
	esta_enfriado = true
