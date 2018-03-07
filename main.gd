#Created By Johnny Rouddro
#ASCII Table : https://www.asciitable.com/

extends Node

var code = ""

func _on_make_pressed():
	randomize()
	for i in 16: #16 digit code
		randomize()
		#numbers 0 to 9 are ASCII 48 to 57
		var num = PoolByteArray([randi()%10+48]).get_string_from_utf8()
		randomize()
		#capital alphabets A to Z are ASCII 65 to 90
		var character = PoolByteArray([randi()%26+65]).get_string_from_utf8()
		randomize()
		if randi()%2 == 0:
			code += String(num)
		else:
			code += String(character)

	var file = File.new()
	
	if not file.file_exists("res://codes.txt"):
		file.open("res://codes.txt", File.WRITE)
		file.close()
		
	file.open("res://codes.txt", File.READ_WRITE)
	if not file.get_line() == "":
		file.seek_end()
		file.store_string("\r\n")
	file.store_string(code)
	file.seek_end()
	file.close()
	print(code)
	get_node("display").add_text(code+"\n")
	code = ""


func _on_save_pressed():
	var codes = File.new()
	codes.open("res://codes.txt", File.READ)
	if not codes.file_exists("res://codes.txt") or codes.get_line() == "":
		print("Nothing to save!")
		get_node("display").set_text("Nothing to save!\n")
		return
	codes.seek(0)
	var dict = File.new()
	dict.open("res://dictionary.txt", File.WRITE)
	dict.store_string("{")
	dict.seek_end()
	while not codes.eof_reached():
		dict.store_string("\"_"+codes.get_line()+"\":false")
		dict.seek_end()
		if not codes.eof_reached():
			dict.store_string(",")
	dict.seek_end()
	dict.store_string("}")
	dict.close()
	codes.close()
	print("Saved!")
	get_node("display").set_text("Saved!\n")
