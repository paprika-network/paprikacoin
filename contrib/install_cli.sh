 #!/usr/bin/env bash

 # Execute this file to install the paprikacoin cli tools into your path on OS X

 CURRENT_LOC="$( cd "$(dirname "$0")" ; pwd -P )"
 LOCATION=${CURRENT_LOC%Paprikacoin-Qt.app*}

 # Ensure that the directory to symlink to exists
 sudo mkdir -p /usr/local/bin

 # Create symlinks to the cli tools
 sudo ln -s ${LOCATION}/Paprikacoin-Qt.app/Contents/MacOS/paprikacoind /usr/local/bin/paprikacoind
 sudo ln -s ${LOCATION}/Paprikacoin-Qt.app/Contents/MacOS/paprikacoin-cli /usr/local/bin/paprikacoin-cli
