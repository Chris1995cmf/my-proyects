class_name nivel
extends Node2D

##ATRIBUTOS
onready var contenedor_proyectiles:Node

## METODOS
func _ready()-> void:
	conectar_seniales()
	crear_contenedores()

## METODOS CUSTUM
func conectar_seniales()-> void:
	EventoDisparos.connect("disparo", self, "_on_disparo")

func crear_contenedores()-> void:
	contenedor_proyectiles = Node.new()
	contenedor_proyectiles.name = "ContenedorProyectiles"
	add_child(contenedor_proyectiles)

func _on_disparo(proyectil:proyectil) -> void:
	contenedor_proyectiles.add_child(proyectil)
