#!/usr/bin/python3

import json
from pathlib import Path
import os

home = Path('.')
for x in home.iterdir():
    if x.is_dir():
        if x.suffix == '.class':
            # Edit propertys.json in directory
            print(x)
            jsonFile = x.joinpath('properties.json')
            propertys = json.load(jsonFile.open())
            propertys['name'] = 'Squeak' + propertys['name']
            propertys['super'] = 'Squeak' + propertys['super']
            json.dump(propertys, jsonFile.open('w'))
        x.rename(x.parent.joinpath('Squeak' + x.name))

