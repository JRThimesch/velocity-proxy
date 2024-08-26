#!/bin/bash
version="8"
echo 'Starting Velocity proxy...'
echo "Version: $version"

java -Xms1G -Xmx1G -XX:+UseG1GC -XX:G1HeapRegionSize=4M -XX:+UnlockExperimentalVMOptions -XX:+ParallelRefProcEnabled -XX:+AlwaysPreTouch -XX:MaxInlineLevel=15 -jar ./velocity*.jar

# Keep the container running
# tail -f /dev/null