#!/bin/bash
version="9"
echo 'Starting Velocity proxy...'
echo "Version: $version"

java -Xms1G -Xmx1G -XX:+UseG1GC -XX:G1HeapRegionSize=4M -XX:+UnlockExperimentalVMOptions -XX:+ParallelRefProcEnabled -XX:+AlwaysPreTouch -XX:MaxInlineLevel=15 -jar ./velocity*.jar &

# Echo the forwarding.secret file
echo "$(cat forwarding.secret)"

# Bring the Java process back to the foreground
fg %1