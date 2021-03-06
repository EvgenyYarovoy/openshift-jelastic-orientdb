#!/bin/bash -x

SED=$(which sed);

#
# This is an example of reset password hook in Jelastic
#

#$J_OPENSHIFT_APP_ADM_USER        ;   Operate this variable for the username
#$J_OPENSHIFT_APP_ADM_PASSWORD    ;   Use this varible for your password
J_OPENSHIFT_APP_ADM_USER="root";

function _setPassword() {
    ORIENTDB_SERVER_PROP_FILE="${OPENSHIFT_ORIENTDB_DIR}/versions/1.7.4/config/orientdb-server-config.xml";
    service cartridge stop;  
    $SED -i "s/password.* resources/password=\"${J_OPENSHIFT_APP_ADM_PASSWORD}\" resources/g" $ORIENTDB_SERVER_PROP_FILE;
    service cartridge start;
}




