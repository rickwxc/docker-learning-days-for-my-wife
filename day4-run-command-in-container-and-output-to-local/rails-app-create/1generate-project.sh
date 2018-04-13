docker run -it --rm --user "$(id -u):$(id -g)"  -v "$PWD":/rails_app_dir -w /rails_app_dir day4_rails-docker-for-create rails new my_rails_app --skip-bundle 

