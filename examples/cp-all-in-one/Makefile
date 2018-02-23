setup: create_topics init_db create_connector 

create_topics:
	docker-compose exec broker kafka-topics --create --topic quickstart-avro-offsets --partitions 1 --replication-factor 1 --if-not-exists --zookeeper zookeeper:2181 
	docker-compose exec broker kafka-topics --create --topic quickstart-avro-config --partitions 1 --replication-factor 1 --if-not-exists --zookeeper zookeeper:2181 
	docker-compose exec broker kafka-topics --create --topic quickstart-avro-status --partitions 1 --replication-factor 1 --if-not-exists --zookeeper zookeeper:2181 

init_db:
	psql -h localhost -p 5432 -U postgres < init.sql

stream_data:
	bash stream_data.sh

create_connector:
	http http://localhost:8083/connectors < postgres-connect.json

read_messages:
	docker-compose exec schema_registry kafka-avro-console-consumer --bootstrap-server broker:9092 --topic quickstart-jdbc-test --from-beginning
