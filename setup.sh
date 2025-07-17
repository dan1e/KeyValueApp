#responsible for creating volumes and networks
source .env.network
source .env.volume

if ["$(docker volume ls -q -f name=$VOLUME_NAME)" ]; then
    echo "A volume with the name $VOLUME_NAME already exists. Skipping volume creation."
else
    docker volume create $VOLUME_NAME
fi    