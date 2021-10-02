docker run -d --init \
    --name jupyterlab \
    --hostname jupyterlab \
    --log-opt max-size=50m \
    -p 8888:8888 \
    -e DOCKER_USER=$(id -un) \
    -e DOCKER_USER_ID=$(id -u) \
    -e DOCKER_PASSWORD=$(id -un) \
    -e DOCKER_GROUP_ID=$(id -g) \
    -v /Users/giulianolangella:/home/giulianolangella \
    -v /Users/giulianolangella:/workdir \
    dclong/jupyterlab /scripts/sys/init.sh
#    -v "$(dirname $HOME)":/home_host \

sleep 5
docker exec -u $(id -un) jupyterlab /scripts/sys/list_jupyter.py

