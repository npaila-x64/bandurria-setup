NETWORK_NAME=chatbot_network

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
        @echo "Starting Chatbot Service..."
        sudo docker-compose -f docker-compose-chatbot.yaml up -d
        @echo "Starting API Gateway..."
        sudo docker-compose -f docker-compose-api-gateway.yaml up -d
        @echo "Starting Chatbot Application..."
        sudo docker-compose -f docker-compose-chatbot-app.yaml up -d
        @echo "All services started."

# Stop all services
.PHONY: down
down:
        @echo "Stopping Index Service..."
        sudo docker-compose -f docker-compose-index.yaml down --volumes
        @echo "Stopping Chatbot Service..."
        sudo docker-compose -f docker-compose-chatbot.yaml down
        @echo "Stopping API Gateway..."
        sudo docker-compose -f docker-compose-api-gateway.yaml down
        @echo "Stopping Chatbot Application..."
        sudo docker-compose -f docker-compose-chatbot-app.yaml down
        @echo "All services stopped."

# Pull all services
.PHONY: pull
pull:
        @echo "Building Index Service..."
        sudo docker pull npailax64/asistente_ia-index_service
        @echo "Building Chatbot Service..."
        sudo docker pull npailax64/asistente_ia-chatbot_service
        @echo "Building API Gateway..."
        sudo docker pull npailax64/asistente_ia-api_gateway
        @echo "Building Chatbot Application..."
        sudo docker pull npailax64/asistente_ia-chatbot_app
        @echo "All services built."

# Recreate all services
.PHONY: pull-up
pull-up: pull create_network up


# Delete all images with tag <none>
.PHONY: delete-dangling-images
delete-dangling-images:
        sudo docker images | grep none | awk '{ print $3; }' | xargs docker rmi -f
