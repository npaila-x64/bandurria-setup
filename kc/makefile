NETWORK_NAME=komatsu_assistant_network
IMAGE_REPO=npailax64

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
		@echo "Starting services..."
		sudo docker-compose -f docker-compose-index.yaml up -d
		sudo docker-compose -f docker-compose-chat-log.yaml up -d
		sudo docker-compose -f docker-compose-assistant.yaml up -d
		sudo docker-compose -f docker-compose-api-gateway.yaml up -d
		sudo docker-compose -f docker-compose-assistant-app.yaml up -d
		@echo "All services started."

# Stop all services
.PHONY: down
down:
		@echo "Stopping services..."
		sudo docker-compose -f docker-compose-index.yaml down --volumes
		sudo docker-compose -f docker-compose-chat-log.yaml down
		sudo docker-compose -f docker-compose-assistant.yaml down
		sudo docker-compose -f docker-compose-api-gateway.yaml down
		sudo docker-compose -f docker-compose-assistant-app.yaml down
		@echo "All services stopped."

# Pull all services
.PHONY: pull
pull:
		@echo "Building services..."
		sudo docker pull $(IMAGE_REPO)/asistente_ia-index_service
		sudo docker pull $(IMAGE_REPO)/asistente_ia-chat_log_service
		sudo docker pull $(IMAGE_REPO)/asistente_ia-assistant_service
		sudo docker pull $(IMAGE_REPO)/asistente_ia-api_gateway
		sudo docker pull $(IMAGE_REPO)/asistente_ia-assistant_app
		@echo "All services built."

# Recreate all services
.PHONY: pull-up
pull-up: pull create_network up


# Delete all images with tag <none>
.PHONY: delete-dangling-images
delete-dangling-images:
		sudo docker images | grep none | awk '{ print $3; }' | xargs docker rmi -f
