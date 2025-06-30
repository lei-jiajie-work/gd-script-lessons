extends Node
enum Positions {PROJECT_MANAGER,
	MANAGER,
	PRODUCT_MANAGER,
	SUPERVISOR,
	PUBLIC_RELATIONS_OFFICER,
	CHIEF_MARKETING_OFFICER,
	FULL_TIME_WORKER,
	PART_TIME_WORKER,
	INTERN,
	SECURITY_GUARD,
	JANITORIAL_STAFF,
	MAINTENANCE_STAFF,
	NONE
} 
var employee_names : Array = [
	"Siegmeyer", 
	"Saladin", 
	"Gordon", 
	"Alyx", 
	"Ademaro", 
	"Artyom", 
	"Gehrman", 
	"James", 
	"Maria", 
	"Laura"
]
var employee_data : Dictionary = {
	"Siegmeyer" : {
		"employee_id" : 0912985312,
		"position" : Positions.MANAGER,
		"previous_positions" : [
			Positions.FULL_TIME_WORKER,
			Positions.PART_TIME_WORKER,
			Positions.INTERN
		],
		# Measured in months
		"time_with_company" : 64,
		# rounded to nearest dollar
		"salary" : 80_000
	},
	"Saladin" : {
		"employee_id" : 0776132012,
		"position" : Positions.INTERN,
		"previous_positions" : [
			Positions.NONE
		],
		"time_with_company" : 12,
		"salary" : 16_796
	},
	"Gordon" : {
		"employee_id" : 0917480578,
		"position" : Positions.SECURITY_GUARD,
		"previous_positions" : [
			Positions.NONE
		],
		"time_with_company" : 29,
		"salary" : 56_160
	},
	"Alyx" : {
		"employee_id" : 0976541123,
		"position" : Positions.MANAGER,
		"previous_positions" : [
			Positions.FULL_TIME_WORKER,
		],
		"time_with_company" : 37,
		"salary" : 68_640
	},
	"Ademaro" : {
		"employee_id" : 0712374231,
		"position" : Positions.FULL_TIME_WORKER,
		"previous_positions" : [
			Positions.NONE
		],
		"time_with_company" : 26,
		"salary" : 52_000
	},
	"Artyom" : {
		"employee_id" : 0942139458,
		"position" : Positions.MAINTENANCE_STAFF,
		"previous_positions" : [
			Positions.NONE
		],
		# Measured in months
		"time_with_company" : 5,
		# rounded to nearest dollar
		"salary" : 58_240
	},
	"Gehrman" : {
		"employee_id" : 0762229543,
		"position" : Positions.FULL_TIME_WORKER,
		"previous_positions" : [
			Positions.NONE
		],
		"time_with_company" : 45,
		"salary" : 55_120
	},
	"James" : {
		"employee_id" : 0912985312,
		"position" : Positions.PART_TIME_WORKER,
		"previous_positions" : [
			Positions.NONE,
		],
		"time_with_company" : 14,
		"salary" : 45_760
	},
	"Maria" : {
		"employee_id" : 0902340943,
		"position" : Positions.MANAGER,
		"previous_positions" : [
			Positions.FULL_TIME_WORKER
		],
		"time_with_company" : 124,
		"salary" : 148_200
	},
	"Laura" : {
		"employee_id" : 0988823409,
		"position" : Positions.MANAGER,
		"previous_positions" : [
			Positions.FULL_TIME_WORKER,
			Positions.PART_TIME_WORKER,
			Positions.INTERN
		],
		"time_with_company" : 63,
		"salary" : 80_000
	},
} 

func _ready():
	# this locks the dictionary
	employee_data.make_read_only()
	# you can comment things by adding a "#" in front of something
	# computers ignore comments
	#demo_1()
	#demo_2()
	#activity()

func demo_1() -> void:
	var filtered_employees : Dictionary = employee_data
	var year_check_num = 5 * 12
	for employee in filtered_employees.keys():
		print_rich("%s%s has worked here for %s %s%s" %[
				"[color=blue]" if filtered_employees[employee]["time_with_company"] >
				(year_check_num) else "",
				employee,
				snapped(filtered_employees[employee]["time_with_company"]/12.0, 0.1),
				"year" if filtered_employees[employee]["time_with_company"]/12 == 1 else
				"years",
				"[/color]" if filtered_employees[employee]["time_with_company"] >
				(year_check_num) else ""
			]
		)
		if filtered_employees[employee]["time_with_company"] > (year_check_num):
			pass

func demo_2() -> void:
	var filtered_employee_names : Array = employee_names
	print(str(filtered_employee_names) + "\n")
	for i in filtered_employee_names:
		for employee in filtered_employee_names.size() - 1:
			var employee_name = filtered_employee_names[employee]
			var next_employee_name = filtered_employee_names[employee + 1]
			if (
				employee_data[employee_name]["salary"] >\
				employee_data[next_employee_name]["salary"]
			):
				var temp = filtered_employee_names[employee + 1]
				filtered_employee_names[employee + 1] =\
				filtered_employee_names[employee]
				filtered_employee_names[employee] = temp
	
	#docs.godotengine.org/en/stable/classes/class_%40gdscript.html
	for e in range(filtered_employee_names.size()-1, -1, -1):
		var employee = filtered_employee_names[e]
		print("%s makes %s dollars per year" % [
				employee, 
				employee_data[employee]["salary"]
			]
		)

func activity() -> void:
	# remove the "return" and write your code below
	return
