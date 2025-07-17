#1. Stop and remove mongodb containers
#2. Stop and remove app containers
#3. Remove volumes
#4. Remove networks

source .env.volume
source .env.network
source .env.db


if [ "$(docker ps -q -f name=$DB_CONTAINER_NAME)" ]; then
    docker kill $DB_CONTAINER_NAME | echo "$DB_CONTAINER_NAME already removed"
else
    echo "The $DB_CONTAINER_NAME doesn't exist. Skipping deletion"
fi

if [ "$(docker volume ls -q -f name=$VOLUME_NAME)" ]; then
    docker volume rm $VOLUME_NAME | echo "$VOLUME_NAME already removed"
else
    echo "The $VOLUME_NAME doesn't exist. Skipping deletion"
fi    

if [ "$(docker network ls -q -f name=$NETWORK_NAME)" ]; then
    docker network rm $NETWORK_NAME | echo "$NETWORK_NAME already removed"
else
    echo "The $NETWORK_NAME doesn't exist. Skipping deletion"
fi
