import os
import re

for root, dirs, files in os.walk("."):
    for file in files:
        if file.endswith(".st"):
            lines = open(os.path.join(root, file), "r").readlines()
            stringout = lines[0] + lines[1]
            for line in lines[2:]:
                stringout += re.sub(r"(?<!self )numArgs(?!:| :)", "self numArgs", line)
            open(os.path.join(root, file), "w").write(stringout)
