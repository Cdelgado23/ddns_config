FROM ubuntu:latest

RUN apt-get update && apt-get install -y cron curl

WORKDIR /src

COPY update_ddns.sh /src/
COPY Crontab /etc/cron.d/

RUN chmod +x /src/*.sh
RUN touch /var/log/cron.log


RUN curl https://cronitor.io/install-linux?sudo=0 -H "API-KEY: <CRONITAR TOKEN>"  | sh
RUN cronitor discover --auto --hostname <SERVER_NAME>

RUN crontab /etc/cron.d/Crontab

CMD cron && tail -f /var/log/cron.log