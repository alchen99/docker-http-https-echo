FROM node:9.2-alpine

WORKDIR /app

COPY . .

RUN apk update \
    && apk upgrade \
    && apk --no-cache add openssl \
    && npm install --production \
    && ls -la . \
    && ./generate-cert.sh

EXPOSE 80 443


ENTRYPOINT ["node", "./index.js"]
CMD []
