extends Object
class_name  AvatarService

var avatars: Array = []

func _init() -> void:
	randomize()
	avatars = [
		Avatar.new(1, "Spyros"),
		Avatar.new(2, "Efi"),
		Avatar.new(3, "Christina"),
		Avatar.new(4, "Maria"),
		Avatar.new(5, "Fanis"),
		Avatar.new(6, "Stelios"),
		Avatar.new(7, "Melina"),
		Avatar.new(8, "Alex"),
		Avatar.new(9, "Antonis"),
		Avatar.new(10, "Eleni"),
		Avatar.new(11, "Nadia"),
		Avatar.new(12, "James"),
		Avatar.new(13, "Ioanna"),
		Avatar.new(14, "Antonia"),
		Avatar.new(15, "Margarita"),
		Avatar.new(16, "George"),
		Avatar.new(17, "Nikos"),
		Avatar.new(18, "Katerina"),
		Avatar.new(19, "Olga"),
		Avatar.new(20, "Magda"),
		Avatar.new(21, "Barbara"),
		Avatar.new(22, "Leonidas"),
		Avatar.new(23, "Bill"),
		Avatar.new(24, "Alice"),
		Avatar.new(25, "Sotiria"),
		Avatar.new(26, "Sotiris"),
		Avatar.new(27, "Marina"),
		Avatar.new(28, "Ourania"),
		Avatar.new(29, "Fotini"),
		Avatar.new(30, "Prodromos"),
		Avatar.new(31, "Theodosis"),
		Avatar.new(32, "Athanasia"),
		Avatar.new(33, "Patroklos"),
		Avatar.new(34, "Stella"),
		Avatar.new(35, "Anastasia"),
		Avatar.new(36, "Chrysa"),
		Avatar.new(37, "Stamatis"),
		Avatar.new(38, "Isidoros"),
		Avatar.new(39, "Theodora"),
		Avatar.new(40, "John"),
		Avatar.new(41, "Achileas"),
		Avatar.new(42, "Marianna"),
		Avatar.new(43, "Gerasimos"),
		Avatar.new(44, "Evdokia"),
		Avatar.new(45, "Ilias"),
		Avatar.new(46, "Thalis"),
		Avatar.new(47, "Savvas"),
		Avatar.new(48, "Vivi"),
		Avatar.new(49, "Florentia"),
		Avatar.new(50, "Claudia")
		]

func get_random(count: int) -> Array:
	var random_avatars: Array = []
	var initial_avatars: Array = avatars.duplicate(true)
	
	for i in range(count):
		var random_number = randi() % initial_avatars.size()
		random_avatars.push_back(initial_avatars[random_number])
		initial_avatars.remove_at(random_number)
	
	return random_avatars
