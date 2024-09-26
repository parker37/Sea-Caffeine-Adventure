extends Node

@export var inventory: Inventory
var dialogue_on = false

var is_trashing : bool

var coffee : Array = ["darkcoffee", "milkcoffee", "greencoffee", "seasaltfoam"]

#preload item resources
var darkcoffee_item = preload("res://assets/pickups/darkcoffee.tres")
var emptycup_item = preload("res://assets/pickups/emptycup.tres")
var greencoffee_item = preload("res://assets/pickups/greencoffee.tres")
var milkbottle_item = preload("res://assets/pickups/milkbottle.tres")
var milkcoffee_item = preload("res://assets/pickups/milkcoffee.tres")
var rocksalt_item = preload("res://assets/pickups/rocksalt.tres")
var sanddollar_item = preload("res://assets/pickups/sanddollar.tres")
var seasaltfoam_item = preload("res://assets/pickups/seasaltfoam.tres")
var seaweed_item = preload("res://assets/pickups/seaweed.tres")
var sharktooth_item = preload("res://assets/pickups/sharktooth.tres")
var squidinkbottle_item = preload("res://assets/pickups/squidinkbottle.tres")

#enum for item ids
enum pickup_ids{
	sanddollar_clam = 0,
	sanddollar_salt = 1,
	sanddollar_seaweed = 2,
	sanddollar_squid = 3,
	sanddollar_whale = 4,
	emptycup = 5,
	seaweed = 6,
	sharktooth = 7
}

#bools to check progress on item pickups
var collected_sanddollars : Array

var picked_up_emptycup : bool
var picked_up_seaweed : bool
var picked_up_sharktooth : bool
var picked_up_sanddollar : bool

#bools to check progress with charles
var start_quest : bool = true
var turned_in_cup : bool
var turned_in_seaweed : bool
var turned_in_squidink : bool
var turned_in_milk : bool
var turned_in_salt : bool
var has_table : bool

#bools to check progress on characters
var completed_sharks : bool
var completed_whale : bool
var completed_squid : bool
var completed_pufferfish : bool
var completed_clam : bool
var pearl_first_talk : bool = true

func _ready():
	collected_sanddollars = []
	inventory = Inventory.new()
