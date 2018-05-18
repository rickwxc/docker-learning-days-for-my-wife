#docker run -it  --entrypoint "geth"  --rm  --name day6_geth day6_geth   attach http://localhost:8545
docker run -it  --entrypoint "tail"  --rm  --name day6_geth day6_geth     -f /dev/null 
