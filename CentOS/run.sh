#!/bin/bash

if [ "${AUTHORIZED_KEYS}" != "nil" ]; then
  mkdir -p /home/panev/.ssh
  chmod 700 /home/panev/.ssh
  touch /home/panev/.ssh/authorized_keys
  chmod 600 /home/panev/.ssh/authorized_keys
  echo ${AUTHORIZED_KEYS} > /home/user/.ssh/authorized_keys
  chown -R panev /home/panev/.ssh
fi

exec /usr/sbin/init