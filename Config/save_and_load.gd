extends Node

const DEFAULT_ENCRYPT_SAVE_CODE = 'Tu4Ml5v1wFjNq7IqsRfK'
const SAVE_DIR = "user://saves/"

# save data in SAVE_DIR + file_name
# @param {JSON} data - The data which will be saved
# @param {string} file_name - The save file's name
# @param {string} encrypt_save_code - The code to encrypt the file.
# @returns {void}
func save_data(data, file_name, encrypt_save_code = DEFAULT_ENCRYPT_SAVE_CODE) -> int:
	var dir = Directory.new()
	if !dir.dir_exists(SAVE_DIR):
		dir.make_dir_recursive(SAVE_DIR)
	
	var save_path = SAVE_DIR + file_name

	var file = File.new()
	var error = file.open_encrypted_with_pass(save_path, File.WRITE, encrypt_save_code)
	if error == OK:
		file.store_var(data)
		file.close()
	return error

# Load data from SAVE_DIR + file_name
# @param {string} file_name - The save file's name
# @param {string} encrypt_save_code - The code to encrypt the file.
# @returns {int\JSON} - Int for the error from the error enum. Json when it's loaded the data from the file
func load_data(file_name, encrypt_save_code = DEFAULT_ENCRYPT_SAVE_CODE):
	var save_path = SAVE_DIR + file_name
	
	var file = File.new()
	if file.file_exists(save_path):
		var error = file.open_encrypted_with_pass(save_path, File.READ, encrypt_save_code)
		if error == OK:
			var file_data = file.get_var()
			file.close()
			return file_data
		return error
	return ERR_FILE_NOT_FOUND
