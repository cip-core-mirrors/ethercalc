#!/bin/sh
# Custom EtherCalc startup script
# Enable REDIS if found in environment variables
#####################################################################

if [ -n "$REDIS_PASSWORD" -a "$DEPL_ID" ]; then
  REDIS_HOST=$(eval echo \$REDIS_${DEPL_ID^^}_SERVICE_HOST)
  REDIS_PORT=$(eval echo \$REDIS_${DEPL_ID^^}_SERVICE_PORT)
  REDIS_PASS="$REDIS_PASSWORD"
  export REDIS_HOST REDIS_PORT REDIS_PASS
else
  echo "Environment variables REDIS_PASSWORD and DEPL_ID missing, Redis backend will not be enabled."
fi

pm2 start -x `which ethercalc` -- --cors && pm2 logs
