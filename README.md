# Docker Development Environment

## Services provided:
- Nginx 1.19.5
- PHP-fpm 8.0
- MariaDB 10.5.8
- Elasticsearch 7.9.3
- Redis 6.0.9
- Mailcatcher
- RabbitMQ 3.8.9-management
- Varnish 6.5

## Instructions
1. Put the codebase in ```./src```
2. run ```make up```

## commands:
- ```make up```: Start all the services containers
- ```make stop```: Stop all the services containers
- ```make down```: Kill all the services containers
- ```make app```: Enter the app container running php
- ```make nginx```: Enter nginx container
- ```make db```: Enter mysql container
- ```make es```: Enter elasticsearch container
- ```make mailcatcher```: Enter mailcatcher container
- ```make rabbitmq```: Enter rabbitmq container
- ```make varnish```: Enter varnish container

## Entrypoint: /var/www/html/default
For custom configurations, put the config inside ```configs/\<service\>``` and map it on ```docker-composer.yml```