import json

with open('movies_elastic2.json', 'r', encoding='utf-8') as file:
    lines = file.readlines()

new_lines = [line.replace('"movie"', '"_doc"') for line in lines]

with open('movies_elastic2_fixed.json', 'w', encoding='utf-8') as file:
    file.writelines(new_lines)
