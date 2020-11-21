FROM python:3.8-buster

RUN pip install flask && \
    apt-get update && \
    apt-get install --no-install-recommends --no-install-suggests -y gnupg ca-certificates curl && \
    curl -s https://apt.exogress.com/KEY.gpg | apt-key add - && \
    echo "deb https://apt.exogress.com/ /" > /etc/apt/sources.list.d/exogress.list && \
    apt update && \
    apt install exogress

ADD . /exogress-flask
WORKDIR /exogress-flask

CMD ["exogress", "spawn", "--", "flask", "run"]
