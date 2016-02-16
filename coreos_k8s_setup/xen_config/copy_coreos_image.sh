#!/bin/bash
# sample value for LV_PATH=/dev/mapper/VolGroupXen-worker0
bunzip2 --stdout coreos_production_xen_image.bin.bz2 >  ${LV_PATH}
blockdev --rereadpt ${LV_PATH}
