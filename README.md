# Docker 101 @ Nerdearla 2022

Estas son las instrucciones que seguí para mi charla de Nerdearla 101 en el año 2022.

[![Watch the video](https://img.youtube.com/vi/IyXGesw8ZJY/maxresdefault.jpg)](https://youtu.be/IyXGesw8ZJY)


Iniciar un contenedor busybox

```
docker run busybox echo hola
docker run busybox uname -a
```

Iniciar un contenedor Nginx

`docker run nginx`

Exponer un puerto

`docker run -p 8080:80 nginx`

Montar un volumen

`docker run -p 8080:80 -v $PWD:/usr/share/nginx/html`

Comandos docker

```
docker run mysql
docker run -e MYSQL_ROOT_PASSWORD=root mysql
docker run -e MYSQL_ROOT_PASSWORD=root mysql:8.0.29
```

Comandos comunes

```
docker pull mysql:8.0.28
docker images
docker ps
docker ps -a
docker start 
docker logs <name>
docker exec -it <id> sh
docker run -d nginx:alpine
docker stop
```

Escribiendo Dockerfile, explicar alpine, tags, cmd y build

```
FROM node:12.22.12-alpine3.15

RUN apk add --no-cache python2 build-base

WORKDIR /app
COPY app .
RUN yarn install --production

CMD ["node", "/app/src/index.js"]
```

```
docker build -t getting-started
docker run getting-started
docker run -p 3000:3000 getting-started
docker run -dp 3000:3000 getting-started
```

Mostrar escribir en DB

```
docker run -v $PWD/app/etc:/etc/todos -p 3000:3000 getting-started
```

Mostrar modificar codigo al vuelo

```
docker run -d -v $PWD/app/etc:/etc/todos -v $PWD/app/src:/app/src -p 3000:3000 getting-started
vim app/src/static/js/app.js
```

Crear una nueva version

```
docker build -t getting-started:v2 .
docker tag <id> pablokbs/getting-started:v2
docker push pablokbs/getting-started:v2
```

Multi-container

Buscar imagen mysql y leer doc

```
docker run -d \
-v mysql-data:/var/lib/mysql
-e MYSQL_ROOT_PASSWORD=root
-e MYSQL_DATABASE=wordpress
mysql:8
```

Correr mysql -p

```
docker exec -it <id> mysql -p
show databases;
```

Mostrar docker-compose

```
vim docker-compose.yaml
docker-compose up -d
```

---

Crear docker-compose con certificado en server Linode

`ssh root@172.105.152.91`

Usar `docker-compose-nginx.yaml` primero

```
scp docker-compose-nginx.yaml root@172.105.152.91:docker-compose.yaml
scp docker-compose-nginx-ssl.yaml root@172.105.152.91:docker-compose.yaml
```





