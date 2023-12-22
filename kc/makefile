NETWORK_NAME=komatsu_assistant_network

.PHONY: create_network
create_network: delete_network
		@echo "Creating Docker network $(NETWORK_NAME)..."
		@docker network create $(NETWORK_NAME)

# Delete the network if it exists
.PHONY: delete_network
delete_network: down
		@if [ "$$(docker network ls -q -f name=$(NETWORK_NAME))" ]; then \
				echo "Network $(NETWORK_NAME) exists, deleting it..."; \
				docker network rm $(NETWORK_NAME); \
		fi

# Start all services
.PHONY: up
up: create_network
		@echo "Starting Index Service..."
		sudo docker-compose -f docker-compose-index.yaml up -d
		@echo "Starting Chat Log Service..."
		sudo docker-compose -f docker-compose-chat-log.yaml up -d
		@echo "Starting Assistant Service..."
		sudo docker-compose -f docker-compose-assistant.yaml up -d
		@echo "Starting API Gateway..."
		sudo docker-compose -f docker-compose-api-gateway.yaml up -d
		@echo "Starting Assistant Application..."
		sudo docker-compose -f docker-compose-assistant-app.yaml up -d
		@echo "All services started."

# Stop all services
.PHONY: down
down:
		@echo "Stopping Index Service..."
		sudo docker-compose -f docker-compose-index.yaml down --volumes
		@echo "Stopping Chat Log Service..."
		sudo docker-compose -f docker-compose-chat-log.yaml down
		@echo "Stopping Assistant Service..."
		sudo docker-compose -f docker-compose-assistant.yaml down
		@echo "Stopping API Gateway..."
		sudo docker-compose -f docker-compose-api-gateway.yaml down
		@echo "Stopping Assistant Application..."
		sudo docker-compose -f docker-compose-assistant-app.yaml down
		@echo "All services stopped."

# Pull all services
.PHONY: pull
pull:
		@echo "Building Index Service..."
		sudo docker pull npailax64/asistente_ia-index_service
		@echo "Building Chat Log Service..."
		sudo docker pull npailax64/asistente_ia-chat_log_service
		@echo "Building Assistant Service..."
		sudo docker pull npailax64/asistente_ia-assistant_service
		@echo "Building API Gateway..."
		sudo docker pull npailax64/asistente_ia-api_gateway
		@echo "Building Assistant Application..."
		sudo docker pull npailax64/asistente_ia-assistant_app
		@echo "All services built."

# Recreate all services
.PHONY: pull-up
pull-up: pull create_network up


# Delete all images with tag <none>
.PHONY: delete-dangling-images
delete-dangling-images:
		sudo docker images | grep none | awk '{ print $3; }' | xargs docker rmi -f
