#!/bin/zsh

# yes, i write my shellscripts in zsh because it's BETTER, what are you gonna
# do about it? cry? piss your pants? maybe shit and cum???? also ngl,
# programming is useful everywhere when you're working with computers, who
# coulda thunk it?

echo "calculating..."

LENGTH=0

for file in music/*.ogg; do
  if [ -f "$file" ]; then
    echo "probing \"$file\"..."
    PROBE=$(ffprobe -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$file" 2>/dev/null)
    LENGTH="$LENGTH+$PROBE"
  fi
done

LENGTH=$((LENGTH))
LENGTH=$(echo -n "$LENGTH" | cut -d'.' -f1)

echo "calculated!"

SECS=$((LENGTH))
MINS=$((SECS/60))
HRS=$((MINS/60))

SECS_REM=$((SECS - (MINS * 60)))
if [ $SECS_REM -lt 10 ]; then
  SECS_REM=$(echo -n "0$SECS_REM")
fi

MINS_REM=$((MINS - (HRS * 60)))
if [ $MINS_REM -lt 10 ]; then
  MINS_REM=$(echo -n "0$MINS_REM")
fi

DURATION=$(echo -n "$HRS:$MINS_REM:$SECS_REM")

echo "total duration (hms): $DURATION"
