#!/bin/bash
curl -s wttr.in/Rennes?format=3 > /tmp/weather
if [ $(fgrep -c -i "redirect" /tmp/weather ) -gt 0 ]; then
	echo Sign In to Network;
elif [ $(fgrep -c -i "query|queries" /tmp/weather) -gt 0 ]; then
	echo Temporarily Down;
else
	cat /tmp/weather | cut -c 16- | head -n 2 | xargs;
fi
