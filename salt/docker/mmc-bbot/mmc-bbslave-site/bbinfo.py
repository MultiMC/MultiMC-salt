import json

bbinfo = None
with open('private/info.json', 'r') as f:
    bbinfo = json.load(f)
