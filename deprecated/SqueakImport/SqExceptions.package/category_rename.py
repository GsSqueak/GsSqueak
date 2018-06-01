import json
from pathlib import Path

home = Path('.')
for x in home.iterdir():
    if x.is_dir():
        if x.suffix == '.class':
            # Edit propertys.json in directory
            print(x)
            jsonFile = x.joinpath('properties.json')
            propertys = json.load(jsonFile.open())
            propertys['category'] = 'SqExceptions-' + propertys['category']
            json.dump(propertys, jsonFile.open('w'))

