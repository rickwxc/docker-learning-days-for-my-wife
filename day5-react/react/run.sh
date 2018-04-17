#!/bin/sh

docker_compose_cache_file_name="docker-compose.yml"

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

		docker run -it --rm  -v "$PWD":/react_app_dir -w /react_app_dir day5_react   create-react-app "$2" 

		exit
	fi

	echo $usage_info
	echo $init_usage
	exit
fi

if [ $1 == 'start' ]; then
	if [ $2 ]; then
		if [ -d "$2" ] && [ -r "$2/package.json" ]; then
			echo "--- now starting dev server for: $2 ---"

			sed  "s/#app_dir_name#/$2/g" docker-compose.template > $docker_compose_cache_file_name
			docker-compose up --build

			exit
		fi

		echo "Error: '$2' must be a react projects directory and '$2/package.json' is readable." 

		exit
	fi

	echo $usage_info
	echo $start_usage

	exit
fi





