FROM ubuntu
MAINTAINER Marcin Kasi�ski <marcin.kasinski@gmail.com> 

RUN apt update && apt install -y krb5-kdc krb5-admin-server supervisor wamerican

ADD conf/supervisord.conf /etc/supervisord.conf
ADD start.sh /
RUN sed -i -e 's/\r//g' /start.sh
RUN chmod +x /start.sh
ENTRYPOINT [ "/start.sh" ]