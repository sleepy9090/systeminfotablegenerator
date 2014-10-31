#!/bin/bash

### Copyright (c) Shawn M. Crawford All Rights Reserved.
###
### Launcher script for system info table generator.
###
### Usage:
###    launcher.sh
###
###  Example: ./launcher.sh
###
### @author Shawn M. Crawford <sleepy3d@gmail.com>

OUTPUT_DIR=~/Desktop/systeminfo
OUTPUT_FILE=index.htm
CSS_DIR=${OUTPUT_DIR}/css

echo "Running system info scripts..."

mkdir -p "${CSS_DIR}"

VERSION=$(/bin/cat /proc/version)
VERSION_SIG=$(/bin/cat /proc/version_signature)

/bin/cat > "${OUTPUT_DIR}"/"${OUTPUT_FILE}" <<EOF
<!DOCTYPE html>
<html>
<head>

<title>System Information Table Generator Version 1.0</title>
<link rel="stylesheet" type="text/css" href="css/sysinfo.css">
</head>
<body>

<div class="sysinfo" >

<h1>System Information Table Generator Version 1.0</h1>

<p><a href="${OUTPUT_DIR}/cpuinfo.htm">CPU Info</a></p>
<p><a href="${OUTPUT_DIR}/meminfo.htm">Memory Info</a></p>
<p></p>
<br />
<br />
<br />
<p>${VERSION}</p>
<p>${VERSION_SIG}</p>

</body>
</div>
</html>
EOF

cp sysinfo.css ${CSS_DIR}

./cpuinfo.sh
./meminfo.sh


echo "View document at: ${OUTPUT_DIR}/${OUTPUT_FILE}"
