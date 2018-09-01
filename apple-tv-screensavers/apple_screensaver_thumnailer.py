import json
import urllib.request
import os

from subprocess import run, DEVNULL

APPLE_URL = "http://a1.phobos.apple.com/us/r1000/000/Features/atv/AutumnResources/videos/entries.json"

script_dir = os.path.dirname(os.path.realpath(__file__))
response = urllib.request.urlopen(APPLE_URL)
html = response.read()

resources = json.loads(html)

total_count = 0
for resource in resources:
    total_count += len(resource['assets'])

curr_count = 0
for resource in resources:
    for assets in resource['assets']:
        curr_count += 1
        print("[%02d/%d] %s (%s)" % (curr_count, total_count,
              assets['accessibilityLabel'], assets['timeOfDay']))
        filename = "%s - %s (%s)" % (
            assets['accessibilityLabel'], assets['timeOfDay'], assets['id'])

        run(['bash', 'create_screenshots.sh', assets['url'], filename],
            cwd=os.path.join(script_dir, ".."), stdout=DEVNULL, stderr=DEVNULL)
