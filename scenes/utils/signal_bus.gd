extends Node

signal on_player_take_damage(health: int, amount: int)
signal on_portail_tp(position: Vector2, counter: int)
signal on_portail_end_of_safe()
signal on_portail_end_of_danger(inside: bool)
signal controle_spawner(start: bool)
signal on_score_gained(amount: int)
signal on_total_score_updated(amount: int)
signal on_player_death()
