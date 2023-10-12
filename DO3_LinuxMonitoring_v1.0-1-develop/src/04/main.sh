#!/bin/bash

chmod +x ../04/*.sh

. ./colorsConfig.conf

. ./systemInfo.sh
. ./checkColors.sh
. ./checkArgs.sh

if [ $# -eq 0 ]
then
    default_check

    config=("$column1_background" "$column1_font_color" "$column2_background" "$column2_font_color")
    conf_out=(${config[@]})

    config_check
    args ${config[*]}
    config_out_check
    colors ${config[*]}

    systemInfo ${foreG[${config[0]} - 1]} ${backG[${config[1]} - 1]} ${foreG[${config[2]} - 1]} ${backG[${config[3]} - 1]}

    echo "Column 1 background = ${conf_out[0]} (${colors_name[${config[0]}]})"
    echo "Column 1 background = ${conf_out[1]} (${colors_name[${config[1]}]})"
    echo "Column 2 background = ${conf_out[2]} (${colors_name[${config[2]}]})"
    echo "Column 2 background = ${conf_out[3]} (${colors_name[${config[3]}]})"
else
    echo "There shouldn't be any arguments"
fi
