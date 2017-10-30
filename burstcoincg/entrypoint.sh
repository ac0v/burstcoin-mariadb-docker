#!/bin/bash

CONFFILE=/conf/nxt.properties

declare -A value_of
if test ! -z "$MARIADB_DATABASE" && test ! -z "$MARIADB_ROOT_USER" && test ! -z "$MARIADB_ROOT_PASSWORD"; then
    value_of=(
        [nxt.dbUrl]=jdbc:mariadb://db:3306/$MARIADB_DATABASE
        [nxt.dbUsername]=$MARIADB_ROOT_USER
        [nxt.dbPassword]=$MARIADB_ROOT_PASSWORD
    )
fi

if [ ! -f $CONFFILE ]; then
    value_of[nxt.peerServerHost]=0.0.0.0
    value_of[nxt.uiServerHost]=0.0.0.0
    value_of[nxt.myAddress]=0.0.0.0
    value_of[nxt.allowedUserHosts]=*
    value_of[nxt.allowedBotHosts]=*
fi

for key in "${!value_of[@]}"
do
    value=${value_of[$key]}
    if test -f $CONFFILE && grep -qE "^$key\s*=" $CONFFILE; then 
        sed -i "s/^${key}\s*=.*/${key}=${value}/" $CONFFILE
    else
        echo "$key=$value" >> $CONFFILE
    fi
done

until (echo > /dev/tcp/db/3306) &> /dev/null; do
    echo "burstcoincg is waiting for the db server to be ready..."
    sleep 5
done

ln -s $CONFFILE conf/nxt.properties

/bin/bash burst.sh
