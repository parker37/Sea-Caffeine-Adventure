extends Node

@export var inventory: Inventory
var dialogue_on = false

func _ready():
	inventory = Inventory.new()
