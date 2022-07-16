class_name proyectil
extends Area2D

## ARTIBUTOS
var velocidad:Vector2 = Vector2.ZERO
var danio:float

## METODOS
func crear (pos: Vector2, dir: float, vel: float, danio_p: int) -> void:
	position = pos
	rotation = dir
	velocidad = Vector2(vel , 0).rotated(dir)
	danio = danio_p

func _physics_process(delta: float) -> void:
	position += velocidad * delta


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_VisibilityNotifier2D_screen_exited()-> void:
	queue_free()
