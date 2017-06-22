#!/bin/bash

CUR_DIR=$(cd `dirname $0`; pwd)

SRC_RPM_FILE=devtoolset-4-4.0-9.el7.src.rpm
SRC_DIR=src

if [ ! -f ${CUR_DIR}/${SRC_DIR}/${SRC_RPM_FILE} ] ; then
    if [ ! -d ${CUR_DIR}/${SRC_DIR} ] ; then
        mkdir -p ${CUR_DIR}/${SRC_DIR}
    fi
    wget -O ${CUR_DIR}/${SRC_DIR}/${SRC_RPM_FILE} http://vault.centos.org/centos/7/sclo/Source/rh/devtoolset-4/${SRC_RPM_FILE}
    pushd ${CUR_DIR}/${SRC_DIR} > /dev/null
    rpm2cpio ${SRC_RPM_FILE} | cpio -div
    popd > /dev/null
fi

#mv ${CUR_DIR}/${SRC_DIR}/devtoolset-4.spec ${CUR_DIR}/${SRC_DIR}/devlibset-4.spec
#sed -i 's/devtoolset/devlibset/g' ${CUR_DIR}/${SRC_DIR}/devlibset-4.spec


${CUR_DIR}/../../../../utils/rpm_build.sh  ${CUR_DIR}/${SRC_DIR}  devlibset-4.spec
