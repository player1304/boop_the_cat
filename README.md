## Boop the Cat
A simple Godot 4 demo to learn:

- Path-finding (using AStarGrid2D)
- Top-down camera

### Gameplay
The player controls Boop, a cat that tries to avoid the enemy (with Pac-man like AI). Boop runs faster than the enemy, but can only see a limited area of the map.

A Python script (./map_parsing/parse.py) is used to parse the map in map.txt to a GDScript Vector2 array, which is then used by the AStarGrid2D node to decide solid points.