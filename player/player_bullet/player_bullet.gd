extends AnimatedSprite2D

var velocity = Vector2(1,0)

const SPEED = 300

## Called when the node enters the scene tree for the first time.
#func _ready():
	#pass # Replace with function body.
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass

func _physics_process(delta):
	global_position += velocity * SPEED * delta
	
