#!/bin/sh

/usr/sbin/kdb5_util create -s -r $REALM -P $ADMINPW
kadmin.local -q "add_principal -pw $ADMINPW admin/admin"


/usr/bin/supervisord -c /etc/supervisord.conf


