#/bin/bash
df -h -P | awk 'NR==5 {print $2 }'
