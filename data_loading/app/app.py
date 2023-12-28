import os
import requests

from reader import read_json_file

def post_zip_file(subdirectory_path, filename):
    zip_file_path = f"{subdirectory_path}/{filename}.zip"
    specs = read_json_file(f"{subdirectory_path}/specs.json")

    # Define the form data payload, including the file
    form_data = {
        'id': (None, specs.get('id')),
        'type': (None, specs.get('type')),
        'description': (None, specs.get('description')),
        'file': (f"{filename}.zip", open(zip_file_path, 'rb'))
    }

    response = requests.post('http://localhost:10000/indices', files=form_data)
    print(f"Posted {zip_file_path}: {response.status_code}, {response.text}")

folder_path = 'indices'

def get_immediate_subdirectories(a_dir):
    return [name for name in os.listdir(a_dir)
            if os.path.isdir(os.path.join(a_dir, name))]

for subdirectory_name in get_immediate_subdirectories(folder_path):
    subdirectory_path = f"{folder_path}/{subdirectory_name}"
    post_zip_file(subdirectory_path, subdirectory_name)
