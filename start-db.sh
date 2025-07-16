MONGODB_IMAGE="mongodb/mongodb-community-server"
MONGODB_TAG="7.0-ubuntu2204"
CONTAINER_NAME="mongodb"

# Root credentials
ROOT_USER="root-user"
ROOT_PASSWORD="root-password"

#NETWORK
LOCALHOST_PORT="27017"
CONTAINER_PORT="27017"
NETWORK_NAME="key-value-net"

#STORAGE
VOLUME_NAME="key-value-data"
VOLUME_CONTAINER_PATH="/data/bin"

# Key-value credentials
KEY_VALUE_DB="key-value-db" 
KEY_VALUE_USER="key-value-user"
KEY_VALUE_PASSWORD="key-value-password"

docker run --rm -d --name $CONTAINER_NAME \
    -e MONGODB_INITDB_ROOT_USERNAME=$ROOT_USER \
    -e MONGODB_INITDB_ROOT_PASSWORD=$ROOT_PASSWORD \
    -e KEY_VALUE_DB=$KEY_VALUE_DB \
    -e KEY_VALUE_USER=$KEY_VALUE_USER \
    -e KEY_VALUE_PASSWORD=$KEY_VALUE_PASSWORD \
    -p $LOCALHOST_PORT:$CONTAINER_PORT\
    -v $VOLUME_NAME:$VOLUME_CONTAINER_PATH\
    -v ./db-config/mongo-init.js:/docker-entrypoint-initdb.d/mongo-init.js \
    --network $NETWORK_NAME\
    $MONGODB_IMAGE:$MONGODB_TAG


    