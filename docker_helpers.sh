
# remove all containers
docker container ls -a  |awk '{print $1}' | xargs docker container rm

# remove all images
docker image ls | awk '{print $3}' | xargs docker image rm
