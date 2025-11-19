extends Node2D
@export var allowed_bodies = 5



func spawn_mob():
var new_mob = preload("res://starter_enemy.tscn").instantiate()
%PathFollow2D.progress_ratio = randf()
new_mob.global_position = %PathFollow2D.global_position
add_child(new_mob)


func _on_timer_timeout() -> void:
mob_handler()


func mob_handler():
var current_bodies = $%bodyCounter.get_overlapping_bodies()

if current_bodies.size() < allowed_bodies:
spawn_mob()
print("Enemy Spawned")
elif current_bodies.size() > allowed_bodies:
print("Enemy count exceeded")

extends Area2D
var shooting_in_progress = false

func _physics_process(delta: float) -> void:
var mouse_pos = get_global_mouse_position()
#print(mouse_pos)
look_at(mouse_pos)


func shoot():
const BULLET = preload("res://player_objects/bullet.tscn")
var new_bullet = BULLET.instantiate()
new_bullet.global_position = %shootPoint.global_position
new_bullet.global_rotation = %shootPoint.global_rotation
%shootPoint.add_child(new_bullet)


func _input(event: InputEvent) -> void:
if event is InputEventMouseButton and event.is_pressed() and not shooting_in_progress:
shooting_in_progress = true
await get_tree().create_timer(0.2).timeout
shoot()
shooting_in_progress = false
extends CharacterBody2D
@export var speed = 1000


func _physics_process(delta: float) -> void:
var direction = Input.get_vector("move_left","move_right","move_up","move_down")
velocity = direction * speed
move_and_slide()
