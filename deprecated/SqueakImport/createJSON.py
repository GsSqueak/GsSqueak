import json
from pathlib import Path

home = Path('.')
for x in home.iterdir():
    if x.is_dir():
        json_dict = {}
        if x.suffix == '.extension' or x.suffix == '.class':
            classname = x.name[:-10]
            for y in x.iterdir():
                if y.is_dir():
                    if y.name == 'instance':
                        json_dict['instance'] = {}
                        for z in y.iterdir():
                            if z.suffix == '.st':
                                json_dict['instance'][z.name] = ""
                    elif y.name == 'class':
                        json_dict['class'] = {}
                        for z in y.iterdir():
                            if z.suffix == '.st':
                                json_dict['class'][z.name] = ""
            f = open(x.as_posix()+'/methodProperties.json', 'w') 
            f.write(json.dumps(json_dict, indent=8, sort_keys=True))
