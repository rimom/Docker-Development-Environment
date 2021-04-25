# Docker Development Environment

### Instructions
1. Put the codebase in one of the following (delete the sample files already in):
- ```./src/aaa``` - Node app
- ```./src/mview``` - PHP app - should only answer GET requests
- ```./src/command``` - PHP App - should only answer POST/PUT/PATCH/DELETE request
- ```./src/frontend``` - Node app
2. Spin up all containers running ```make up```

### Services provided:
- Reverse proxy for frontend: ```Nginx 1.19.5 (fist instance)``` Listening on port 80/443 and redirect to varnish on port 6081
- Cache layer: ```Varnish 6.5``` - Listening on port 6081 and point to "node frontend app" on port 3000
- Node frontend app: ```Node 14.4.0 (first instance)``` - Listening on port 3000, should register the events on event bus listening on port 15672
- Event bus: ```RabbitMQ 3.8.9``` - Listening on port 15672
- Command & Query Event Handler: ```PHP-fpm 8.0 (first instance)``` - Script listening for events
- CQRS router: ```Nginx 1.19.5 (second instance)``` - Listening requests on port 8080, redirect POST/PUT/PATCH/DELETE to port 8081 and GET to port 8082
- Command service: ```PHP-fpm 8.0 (second instance)``` - Listening for POST/PUT/PATCH/DELETE on port 8081, writes on MariaDb listening on port 3306 and register event on Event bus
- Materialized View: ```PHP-fpm 8.0 (second instance)``` - Listening for GET on port 8082, reads the event bus, reads the data on mariaDb, writes the data on Neo4j(fisrt instance) Listening on port 7474/7473/7687
- RDBMS: ```MariaDB 10.5.8``` - Listening on port 3306
- Graph Database: ```Neo4j 3.5.3 (first instance)``` - Listening on port 7474/7473/7687
- AAA (Authentication, Authorization and Account): ```Node 14.4.0 (second instance)``` - Listening on port 9090, read/write on Neo4j(second instance) listening on port 8474/8473/8687
- Graph Database: ```Neo4j 3.5.3(second instance)``` - Listening on port 8474/8473/8687
- Logstreaming: ```Filebeat 7.10.1```
- Log queue: ```Redis 6.0.9 (first instance)``` - Listening on port 6379
- Logs Aggregator: ```Logstash 7.10.1```
- Logs text search: ```Elasticsearch 7.10.1``` - Listening on port 9200
- Graphs and dashboard: ```Kibana 7.10.1``` - Listening on port 5601
- Email Interceptor: ```Mailcatcher``` - Listening on port 1080
- Session Storage: ```Redis 6.0.9 (second instance)``` - Listening on port 7379

### All services pre-configured 
 - To flush the cache use ```curl -X PURGE 127.0.0.1```

### Commands:
- ```make up```: Start all containers
- ```make stop```: Stop all containers
- ```make down```: Kill all containers
- ```make restart```: Restart all containers

### For custom configurations:
- Put the config inside ```configs/\<service\>```
- Map the configs on ```docker-composer.yml```

### TBD
- SIEM - ELK Stack with heavy use of Kibana alerts
- WAF - Web application Firewall
- IPS
- Report System
- Contigency plan
### Initial Diagram:
<img src="Dev Architecture.svg">