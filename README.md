Echoes various HTTP/HTTPS request properties back to client, as well as in docker logs. 

![browser](https://raw.githubusercontent.com/alchen99/docker-http-https-echo/master/screenshots/screenshot.png)

## Building

```
docker build -t alchen99/web-echo .
```

Automated build on Docker Hub

[![DockerHub Badge](http://dockeri.co/image/alchen99/web-echo)](https://hub.docker.com/r/alchen99/web-echo/)

## Usage

    docker run -p 8080:80 -p 8443:443 --rm -t alchen99/http-https-echo

Then issue a request via your browser or curl -

    curl -k -X PUT -H "Arbitrary:Header" -d aaa=bbb https://localhost:8443/hello-world
    curl -k -X PUT -H "Arbitrary:Header" -d aaa=bbb http://localhost:8080/hello-world

## Kubernetes

Run `kubectl apply` command for the YAML files in the k8 directory

## Docker Compose

You can substitute the certificate and private key with your own. This example uses the snakeoil cert.

    my-http-listener:
        image: alchen99/http-https-echo
        ports:
            - "8080:80"
            - "8443:443"
        volumes:
            - /etc/ssl/certs/ssl-cert-snakeoil.pem:/app/fullchain.pem
            - /etc/ssl/private/ssl-cert-snakeoil.key:/app/privkey.pem

## Output

#### Curl output

![curl](https://raw.githubusercontent.com/alchen99/docker-http-https-echo/master/screenshots/screenshot2.png)

#### `docker logs` output

![dockerlogs](https://raw.githubusercontent.com/alchen99/docker-http-https-echo/master/screenshots/screenshot3.png)
