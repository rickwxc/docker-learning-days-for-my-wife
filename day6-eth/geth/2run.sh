#docker run -it  --entrypoint "geth"  --rm  --name day6_geth day6_geth   attach http://localhost:8545
docker run -it -p 8545:8545 --entrypoint "tail"  --rm  --name day6_geth day6_geth     -f /dev/null 

#geth --dev --rpcapi "db,eth,net,web3,personal" --rpc  --rpcaddr "0.0.0.0" --rpccorsdomain "*" 

