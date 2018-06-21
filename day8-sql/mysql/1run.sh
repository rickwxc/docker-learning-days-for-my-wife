#data not stored
#docker run -it -p 3306:3306 --rm   -e MYSQL_ROOT_PASSWORD=my-secret-pw --name mysql mysql:5.5

#data stored in your local folder
docker run -it -p 3306:3306 --rm  -v /your_local_path/mysql_data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw --name mysql mysql:5.5
