#!/usr/bin/env sh

# Terminate already running bar instances
# killall -q polybar

# Wait until the processes have been shut down
# while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
#polybar base &
export MONITOR=$(polybar -m|tail -1|sed -e 's/:.*$//g')

if ! pgrep -x polybar; then
	polybar base &
else
	pkill polybar
fi

echo "Bars launched..."

