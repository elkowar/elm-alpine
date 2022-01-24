FROM alpine:3.14

RUN wget -O - 'https://github.com/elm/compiler/releases/download/0.19.1/binary-for-linux-64-bit.gz' \
    | gunzip -c >/usr/local/bin/elm

RUN chmod +x /usr/local/bin/elm

RUN apk update
RUN apk add --update nodejs npm
RUN npm install uglify-js --global

WORKDIR /app

COPY . .

EXPOSE 8000

ENTRYPOINT ["elm"]
CMD ["--help"]
