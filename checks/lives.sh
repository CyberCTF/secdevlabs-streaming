#!/bin/sh
# The backend serves the seeded lives, and the page's bundle writes chat messages with innerHTML.
set -e
curl -fsS http://backend:8080/live/username/mr.robot | grep -q 'Computer repair'
js=$(curl -fsS http://frontend/ | grep -o 'main[.a-z0-9-]*\.js' | head -n 1)
curl -fsS "http://frontend/$js" | grep -q 'innerHTML'
