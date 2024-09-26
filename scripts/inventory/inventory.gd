extends Resource

class_name Inventory

@export var items: Array[InvItem]
@export var selected: bool = false
@export var selectedIndex: int = 0
var inventory_slots: int = 6

signal update_inv_ui

func add_item(new_item: InvItem):
	for i: int in range(inventory_slots):
		if (items[i] == null):
			items[i] = new_item
			update_inv_ui.emit()
			break
		pass

func remove_item(query: Variant):
	# Checks if query is an int, which is used as slot index
	match typeof(query):
		TYPE_INT:
			items[query] = null
			update_inv_ui.emit()
			
		TYPE_OBJECT:
			if(not query is InvItem):
				push_error("Error: Object passed is not InvItem type!")
				return
			var index = items.find(query)
			if(index == -1):
				return
			items[index] = null
			update_inv_ui.emit()
			
		TYPE_STRING:
			for i: int in range(inventory_slots):
				if(items[i].name == query):
					items[i] = null
					update_inv_ui.emit()
					break
	return

func check_for_item(item_name: String, count: int = 1) -> bool:
	var exists = false
	var num_found = 0
	for i: int in range(inventory_slots):
		if(items[i].name == item_name):
			exists = true
			num_found += 1
			if(count == 1 or count == num_found):
				break
	if(exists and count == num_found):
		return true
	else:
		return false 
