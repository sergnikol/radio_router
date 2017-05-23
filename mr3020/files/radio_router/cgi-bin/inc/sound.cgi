#vol_start="-50"
#vol_end="18"
vol_start="0"
#vol_end="30"
vol_end=`cat db/sound_max`
#vol_end=`amixer | grep "Limits" | head -1 | sed -r 's/.*?-[^0-9]*([0-9]+)$/\1/'`
let "sound = (vol_end-vol_start)*sound/100+vol_start"

