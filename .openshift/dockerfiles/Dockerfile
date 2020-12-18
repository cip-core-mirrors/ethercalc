FROM registry.redhat.io/ubi8/nodejs-14:1-17
MAINTAINER Patrice Lachance

RUN npm install ethercalc pm2 rdcli && rm -rf /usr/local/lib/node_modules/ethercalc/node_modules/nodemailer/

COPY entrypoint.sh /opt/app-root/src/entrypoint.sh

ENTRYPOINT /opt/app-root/src/entrypoint.sh
