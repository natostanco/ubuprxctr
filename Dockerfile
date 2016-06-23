FROM ubuntu

RUN apt update

RUN apt install -y -q gcc python3 python3-dev python3-pip git

RUN pip3 install -U git+https://github.com/constverum/ProxyBroker.git

COPY ./scripts /entry

ENTRYPOINT ["sh"]

CMD ["/entry/runppx.sh"]
