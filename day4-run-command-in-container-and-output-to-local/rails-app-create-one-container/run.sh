#!/bin/sh

docker_yml_cache_file_name="Dockerfile_for_yml.cache"
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

		docker run -it --rm --user "$(id -u):$(id -g)"  -v "$PWD":/rails_app_dir -w /rails_app_dir day4_rails-docker-for-rails-all-in-one rails new "$2" --skip-bundle 

		exit
	fi

	echo $usage_info
	echo $init_usage
	exit
fi

if [ $1 == 'start' ]; then
	if [ $2 ]; then
		if [ -d "$2" ] && [ -r "$2/Gemfile" ]; then
			echo "--- now starting dev server for: $2 ---"
			cat dockerfile.template > $docker_yml_cache_file_name
			echo "COPY $2/Gemfile Gemfile" >> $docker_yml_cache_file_name 
			echo "RUN bundle install" >> $docker_yml_cache_file_name 

			sed  "s/#app_dir_name#/$2/g" docker-compose.template >> $docker_compose_cache_file_name
			docker-compose up --build

			exit
		fi

		echo "Error: '$2' must be a rails projects directory and '$2/Gemfile' is readable." 

		exit
	fi

	echo $usage_info
	echo $start_usage

	exit
fi




