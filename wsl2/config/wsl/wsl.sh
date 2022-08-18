
export NNN_BMS="w:/mnt/d/workspace/;"
export PATH=$PATH:/mnt/c/Windows/System32/

alias docker="podman"
# export DISPLAY=:0.0
export DISPLAY=`grep -oP "(?<=nameserver ).+" /etc/resolv.conf`:0.0
