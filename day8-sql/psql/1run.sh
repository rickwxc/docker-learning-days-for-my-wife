#docker run -it -p 6379:6379  --rm  --name redis 
docker run -it --rm  -e POSTGRES_PASSWORD=my-secret-pw --name postgres postgres:latest 
