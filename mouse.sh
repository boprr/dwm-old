!/bin/bash

redshift -P -O 4500
# set mouse
ids=$(xinput --list | awk -v search="ROCCAT ROCCAT Kone Pro Air" \
    '$0 ~ search {match($0, /id=[0-9]+/);\
                  if (RSTART) \
                    print substr($0, RSTART+3, RLENGTH-3)\
                 }'\
     )

for i in $ids
do
    xinput --set-prop $i 'libinput Accel Profile Enabled' 0, 1
    xinput --set-prop $i 'libinput Accel Speed' -0.45
    echo $i
done