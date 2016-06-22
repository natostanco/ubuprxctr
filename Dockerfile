FROM alpine:edge

RUN apk update --no-cache

RUN apk add gcc python3 python3-dev musl-dev git

RUN pip3 install -U git+https://github.com/constverum/ProxyBroker.git

COPY ./scripts /

ENTRYPOINT ["sh"]

CMD ["/runppx.sh"]
