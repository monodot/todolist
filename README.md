# todolist
API backend built in NodeJS using Express to add TODOs to a MongoDB. 

## Build and Run
`npm run dev`

## Start the db 
This requires Docker installed.
`npm run mongodb`


`oc process -f .openshift-applier/templates/todolist-deploy.yml \
    -p NAME=todolist \
    -p APP_TAG=latest \
    -p NAMESPACE=<YOUR_NAME> \
    | oc create -f -`

## Build and run with Docker/Podman

```
podman build -t monodot/todolist .

podman network create todonet

podman run --rm --name mongodb --net todonet -d mongo:4.0

podman run --rm --name todolist --net todonet -e NODE_ENV=production -e OPENSHIFT_NODEJS_PORT=9000 -e OPENSHIFT_MONGODB_DB_URL=mongodb://mongodb/ -e OPENSHIFT_APP_NAME=todolist -p 9000:9000 monodot/todolist
```
