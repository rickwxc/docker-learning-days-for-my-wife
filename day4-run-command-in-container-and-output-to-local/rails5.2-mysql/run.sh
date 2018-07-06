#!/bin/sh

docker_compose_yml="docker-compose.yml"
echo "#This is auto generated file, please do not edit. Edit docker-compose.template instead." > $docker_compose_yml



usage_info="usage:"
init_usage="sh run.sh init new_app_name"
start_usage="sh run.sh start existing_app_directory"

if [ -z "$1" ] && ([ "$1" != 'init' ] || [ "$1" != 'start' ]); then
	echo $usage_info
	echo $init_usage
	echo $start_usage
	exit
fi


if [ $1 == "init" ]; then

	if [ $2 ]; then
		echo "--- now starting new projects: $2 ---"

		docker run -it --rm --user "$(id -u):$(id -g)"  -v "$PWD":/rails_app_dir -w /rails_app_dir day4_rails52_mysql rails new "$2" --skip-bundle 

		exit
	fi

	echo $usage_info
	echo $init_usage
	exit
fi

if [ $1 == 'start' ]; then

	mysql_data_dir="/Users/taoli/docker_files/docker-learning-days-for-my-wife/day4-run-command-in-container-and-output-to-local/rails5.2-mysql/dbdata"
	if [ -d $mysql_data_dir ]; then
		echo "DB data folder: $mysql_data_dir"
	else
		echo 'mysql data dir must be set.' 
		exit
	fi

	if [ $2 ]; then
		echo "--- now starting dev server for: $2 ---"
		cat  docker-compose.template | sed  "s/#app_dir_name#/$2/g" | sed  "s%#app_db_folder#%$mysql_data_dir%g" |  cat >> $docker_compose_yml

		docker-compose up --build
		exit
	fi

	echo $usage_info
	echo $start_usage

	exit
fi




