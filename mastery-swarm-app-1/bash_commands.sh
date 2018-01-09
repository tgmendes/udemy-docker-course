docker service create --name redis --replicas=1 --network frontend redis:3.2
docker service create --name db --replicas=1 --network backend --mount type=volume,source=db-data,target=/var/lib/postgresql/data postgres:9.4
docker service create --name worker --replicas=1 --network backend --network frontend dockersamples/examplevotingapp_worker
docker service create --name vote --replicas=3 -p 8009:80 --network frontend dockersamples/examplevotingapp_vote:before
docker service create --name result --replicas=1 -p 5001:80 --network backend dockersamples/examplevotingapp_result:before
