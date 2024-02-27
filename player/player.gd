extends AnimatedSprite2D

var velocity = Vector2(0, 0)
#slower going up or down 
const SPEED = Vector2(125,90)
const Bullet = preload("res://player/player_bullet/player_bullet.tscn")

# Called when the node enters the scene tree for the first time.
#func _ready():
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print(Input.get_axis("move_left","move_right"))
	velocity.x = Input.get_axis("move_left","move_right")
	#move up is -ve
	velocity.y = Input.get_axis("move_up","move_down")
	#normalized is max of 1 diagonal or (0.7,0.7)
	velocity = velocity.normalized()
	
	#ignore for 0...
	if velocity.x > 0:
		flip_h = false
	elif velocity.x < 0:
		flip_h = true
	
	if Input.is_action_pressed("shoot"):
		var bullet_instance = Bullet.instantiate()
		bullet_instance.global_position = global_position
		get_tree().current_scene.add_child(bullet_instance)
		
		
	
# this is for stuff on screen (collisions etc)...
func _physics_process(delta):	
	global_position += velocity * SPEED * delta
	
	
