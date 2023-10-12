#!/bin/bash

chmod +x ../03/*.sh

. ./systemInfo.sh
. ./checkColors.sh
. ./checkArgs.sh

if [ $# -eq 4 ]
then
    args $@
    colors $@
    systemInfo ${foreG[$1 - 1]} ${backG[$2 - 1]} ${foreG[$3 - 1]} ${backG[$4 - 1]}
else
    echo "There should be 4 arguments"
fi

