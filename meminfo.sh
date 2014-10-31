#!/bin/bash

### Copyright (c) Shawn M. Crawford All Rights Reserved.
###
### This script converts the output of /proc/meminfo into an html document.
###
### Usage:
###    meminfo.sh
###
###  Example: ./meminfo.sh
###
### @author Shawn M. Crawford <sleepy3d@gmail.com>

OUTPUT_FILE=~/Desktop/systeminfo/meminfo.htm

if [ $# -gt 0 ]; then
    MESSAGE=$(${CAT} <<SETVAR
This script converts the output of /proc/meminfo into an html document.
Usage: $0
SETVAR
)
    ${ECHO} "${MESSAGE}"
    exit
fi

fnGetData() {
  VALUE=$(echo ${1} | cut -d: -f2 | sed -e 's/^ *//' -e 's/ *$//')
  echo "${VALUE}"
}

echo "Generating htm doc for mem info..."

/bin/cat > "${OUTPUT_FILE}" <<EOF
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Output of /proc/meminfo</title>


        <link rel="stylesheet" type="text/css" href="css/sysinfo.css">

    </head>
    <body>
        <div class="sysinfo" >
            <table >
                <tr>
                    <td>
                        MemTotal
                    </td>
                    <td>
                        MemFree
                    </td>
                    <td>
                        Buffers
                    </td>
                    <td>
                        Cached
                    </td>
                    <td>
                        SwapCached
                    </td>
                    <td>
                        Active
                    </td>
                    <td>
                        Inactive
                    </td>
                    <td>
                        Active(anon)
                    </td>
                    <td>
                        Inactive(anon)
                    </td>
                    <td>
                        Active(file)
                    </td>
                    <td>
                        Inactive(file)
                    </td>
                    <td>
                        Unevictable
                    </td>
                    <td>
                        Mlocked
                    </td>
                    <td>
                        SwapTotal
                    </td>
                    <td>
                        SwapFree
                    </td>
                    <td>
                        Dirty
                    </td>
                    <td>
                        Writeback
                    </td>
                    <td>
                        AnonPages
                    </td>
                    <td>
                        Mapped
                    </td>
                    <td>
                        Shmem
                    </td>
                    <td>
                        Slab
                    </td>
                    <td>
                        SReclaimable
                    </td>
                    <td>
                        SUnreclaim
                    </td>
                    <td>
                        KernelStack
                    </td>
                    <td>
                        PageTables
                    </td>
                    <td>
                        NFS_Unstable
                    </td>
                    <td>
                        Bounce
                    </td>
                    <td>
                        WritebackTmp
                    </td>
                    <td>
                        CommitLimit
                    </td>
                    <td>
                        Committed_AS
                    </td>
                    <td>
                        VmallocTotal
                    </td>
                    <td>
                        VmallocUsed
                    </td>
                    <td>
                        VmallocChunk
                    </td>
                    <td>
                        HardwareCorrupted
                    </td>
                    <td>
                        AnonHugePages
                    </td>
                    <td>
                        HugePages_Total
                    </td>
                    <td>
                        HugePages_Free
                    </td>
                    <td>
                        HugePages_Rsvd
                    </td>
                    <td>
                        HugePages_Surp
                    </td>
                    <td>
                        Hugepagesize
                    </td>
                    <td>
                        DirectMap4k
                    </td>
                    <td>
                        DirectMap2M
                    </td>
                    <td>
                        DirectMap1G
                    </td>
                </tr>
                <tr>
EOF

/bin/cat /proc/meminfo | while read -r line; do

  VALUE=$(fnGetData "${line}")

  /bin/cat >> "${OUTPUT_FILE}" <<EOF
                    <td>
                        "${VALUE}"
                    </td>
EOF

done

/bin/cat >> "${OUTPUT_FILE}" <<EOF
                </tr>
            </table>
        </div>
    </body>
</html>
EOF

echo "done!"
