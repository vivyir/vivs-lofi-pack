#!/bin/zsh

# i dont care if this doesn't output proper json, it outputs something that
# kind of resembles json and then i can edit the rest, cry and mald for i do
# NOT care

for file in *.mp3; do
  file=$(echo -n $file | cut -d'.' -f1)
  echo "{"
  echo "  \"file\": \"music/${file}.ogg\","
  echo "  \"volume\": 100"
  echo "},"
done
