up:
	docker-compose up -d

down:
	docker-compose down

stop:
	docker-compose stop

app:
	docker exec -it app /bin/bash

nginx:
	docker exec -it nginx /bin/bash

db:
	docker exec -it db /bin/bash

es:
	docker exec -it elasticsearch /bin/bash

redis:
	docker exec -it redis /bin/bash

redis-cli:
	docker exec -it redis redis-cli -a 123456

mailcatcher:
	docker exec -it mailcatcher /bin/bash

rabbitmq:
	docker exec -it rabbitmq /bin/bash

varnish:
	docker exec -it varnish /bin/bash