#!/bin/bash

### Copyright (c) Shawn M. Crawford All Rights Reserved.
###
### This script converts the output of /proc/cpuinfo into an html document.
###
### Usage:
###    cpuinfo.sh
###
###  Example: ./cpuinfo.sh
###
### @author Shawn M. Crawford <sleepy3d@gmail.com>

OUTPUT_FILE=~/Desktop/systeminfo/cpuinfo.htm

if [ $# -gt 0 ]; then
    MESSAGE=$(${CAT} <<SETVAR
This script converts the output of /proc/cpuinfo into an html document.
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

echo "Generating htm doc for cpu info..."

/bin/cat > "${OUTPUT_FILE}" <<EOF
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Output of /proc/cpuinfo</title>

        <link rel="stylesheet" type="text/css" href="css/sysinfo.css">

    </head>
    <body>
        <div class="sysinfo" >
            <table >
                <tr>
                    <td>
                        processor
                    </td>
                    <td >
                        vendor_id
                    </td>
                    <td>
                        cpu family
                    </td>
                    <td>
                        model
                    </td>
                    <td>
                        model name
                    </td>
                    <td>
                        stepping
                    </td>
                    <td>
                        microcode
                    </td>
                    <td>
                        cpu MHz
                    </td>
                    <td>
                        cache size
                    </td>
                    <td>
                        physical id
                    </td>
                    <td>
                        siblings
                    </td>
                    <td>
                        core id
                    </td>
                    <td>
                        cpu cores
                    </td>
                    <td>
                        apicid
                    </td>
                    <td>
                        initial apicid
                    </td>
                    <td>
                        fpu
                    </td>
                    <td>
                        fpu exception
                    </td>
                    <td>
                        cpuid level
                    </td>
                    <td>
                        wp
                    </td>
                    <td>
                        flags
                    </td>
                    <td>
                        bogomips
                    </td>
                    <td>
                        clflush size
                    </td>
                    <td>
                        cache alignment
                    </td>
                    <td>
                        address sizes
                    </td>
                    <td>
                        power management
                    </td>
                </tr>
EOF

/bin/cat /proc/cpuinfo | while read -r line; do

  HEADER=$(echo ${line} | cut -d: -f1 | sed -e 's/^ *//' -e 's/ *$//')

  if [ "${HEADER}" == "processor" ]; then
    PROCESSOR=$(fnGetData "${line}")
  elif [ "${HEADER}" == "vendor_id" ]; then
    VENDOR_ID=$(fnGetData "${line}")
  elif [ "${HEADER}" == "cpu family" ]; then
    CPU_FAMILY=$(fnGetData "${line}")
  elif [ "${HEADER}" == "model" ]; then
    MODEL=$(fnGetData "${line}")
  elif [ "${HEADER}" == "model name" ]; then
    MODEL_NAME=$(fnGetData "${line}")
  elif [ "${HEADER}" == "stepping" ]; then
    STEPPING=$(fnGetData "${line}")
  elif [ "${HEADER}" == "microcode" ]; then
    MICROCODE=$(fnGetData "${line}")
  elif [ "${HEADER}" == "cpu MHz" ]; then
    CPU_MHZ=$(fnGetData "${line}")
  elif [ "${HEADER}" == "cache size" ]; then
    CACHE_SIZE=$(fnGetData "${line}")
  elif [ "${HEADER}" == "physical id" ]; then
    PHYSICAL_ID=$(fnGetData "${line}")
  elif [ "${HEADER}" == "siblings" ]; then
    SIBLINGS=$(fnGetData "${line}")
  elif [ "${HEADER}" == "core id" ]; then
    CORE_ID=$(fnGetData "${line}")
  elif [ "${HEADER}" == "cpu cores" ]; then
    CPU_CORES=$(fnGetData "${line}")
  elif [ "${HEADER}" == "apicid" ]; then
    APICID=$(fnGetData "${line}")
  elif [ "${HEADER}" == "initial apicid" ]; then
    INITIAL_APICID=$(fnGetData "${line}")
  elif [ "${HEADER}" == "fpu" ]; then
    FPU=$(fnGetData "${line}")
  elif [ "${HEADER}" == "fpu_exception" ]; then
    FPU_EXCEPTION=$(fnGetData "${line}")
  elif [ "${HEADER}" == "cpuid level" ]; then
    CPUID_LEVEL=$(fnGetData "${line}")
  elif [ "${HEADER}" == "wp" ]; then
    WP=$(fnGetData "${line}")
  elif [ "${HEADER}" == "flags" ]; then
    FLAGS=$(fnGetData "${line}")
  elif [ "${HEADER}" == "bogomips" ]; then
    BOGOMIPS=$(fnGetData "${line}")
  elif [ "${HEADER}" == "clflush size" ]; then
    CLFLUSH_SIZE=$(fnGetData "${line}")
  elif [ "${HEADER}" == "cache_alignment" ]; then
    CACHE_ALIGNMENT=$(fnGetData "${line}")
  elif [ "${HEADER}" == "address sizes" ]; then
    ADDRESS_SIZES=$(fnGetData "${line}")
  elif [ "${HEADER}" == "power management" ]; then
    POWER_MANAGEMENT=$(fnGetData "${line}")
    # Done with this loop
    LOOP_COMPLETE="YES"
  fi

  if [ "${LOOP_COMPLETE}" == "YES" ]; then

    /bin/cat >> "${OUTPUT_FILE}" <<EOF
                <tr>
                    <td >
                        "${PROCESSOR}"
                    </td>
                    <td>
                        "${VENDOR_ID}"
                    </td>
                    <td>
                        "${CPU_FAMILY}"
                    </td>
                    <td>
                        "${MODEL}"
                    </td>
                    <td>
                        "${MODEL_NAME}"
                    </td>
                    <td>
                        "${STEPPING}"
                    </td>
                    <td>
                        "${MICROCODE}"
                    </td>
                    <td>
                        "${CPU_MHZ}"
                    </td>
                    <td>
                        "${CACHE_SIZE}"
                    </td>
                    <td>
                        "${PHYSICAL_ID}"
                    </td>
                    <td>
                        "${SIBLINGS}"
                    </td>
                    <td>
                        "${CORE_ID}"
                    </td>
                    <td>
                        "${CPU_CORES}"
                    </td>
                    <td>
                        "${APICID}"
                    </td>
                    <td>
                        "${INITIAL_APICID}"
                    </td>
                    <td>
                        "${FPU}"
                    </td>
                    <td>
                        "${FPU_EXCEPTION}"
                    </td>
                    <td>
                        "${CPUID_LEVEL}"
                    </td>
                    <td>
                        "${WP}"
                    </td>
                    <td>
                        "${FLAGS}"
                    </td>
                    <td>
                        "${BOGOMIPS}"
                    </td>
                    <td>
                        "${CLFLUSH_SIZE}"
                    </td>
                    <td>
                        "${CACHE_ALIGNMENT}"
                    </td>
                    <td>
                        "${ADDRESS_SIZES}"
                    </td>
                    <td>
                        "${POWER_MANAGEMENT}"
                    </td>
                </tr>
EOF

  fi

  LOOP_COMPLETE="NO"

done

/bin/cat >> "${OUTPUT_FILE}" <<EOF
            </table>
        </div>
    </body>
</html>
EOF

echo "done!"
