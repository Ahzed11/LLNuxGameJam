extends Node

signal on_player_take_damage(health: int, amount: int)
signal on_portail_tp(position: Vector2)
signal on_portail_end_of_safe()
signal on_portail_end_of_danger(inside: bool)
signal controle_spawner(start: bool)
