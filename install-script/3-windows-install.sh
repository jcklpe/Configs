#!/bin/bash
##- Windows full installation
#set variables
WINHOME=$(wslpath $(cmd.exe /C "echo %USERPROFILE%"));
WINHOME=${WINHOME//$'\015'};
CONFIGS="${WINHOME}/home/Documents/configs";


##- symlink stuff to $WINHOME
# this is currently not working so I'm going to change it to cp
# ln -sf  ${CONFIGS}/hyper-js/windoze.hyper.js ${WINHOME}/AppData/Roaming/Hyper/.hyper.js
cp -f ${CONFIGS}/hyper-js/windows.hyper.js ${WINHOME}/AppData/Roaming/Hyper/.hyper.js
ln -sf  ${CONFIGS}/vscode/settings.json ${WINHOME}/AppData/Roaming/Code/User/settings.json

ln -sf ${CONFIGS}/nextcloud/sync-exclude.lst ${WINHOME}/AppData/Roaming/Nextcloud/sync-exclude.lst
ln -lf ${CONFIGS}/ueli/config.json ${WINHOME}/AppData/Roaming/ueli/config.json


#/AppData/Roaming/Blender/user-pref.blend