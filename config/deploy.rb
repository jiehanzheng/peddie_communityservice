set :application, "peddie_communityservice"

set :scm, :git
set :repository,  "git@us1.jiehan.org:/srv/git/peddie_communityservice.git"
set :branch, "master"
set :deploy_to, "/srv/rails/peddie_communityservice"
set :deploy_via, :remote_cache
ssh_options[:forward_agent] = true
set :use_sudo, false

role :web, "us5.jiehan.org"
role :app, "us5.jiehan.org"
role :db,  "us5.jiehan.org", :primary => true
set :user, "rails"

set :rvm_type, :system
set :rvm_ruby_string, '1.9.3'


require "rvm/capistrano"
require "bundler/capistrano"

after "deploy", "deploy:migrate"

set :keep_releases, 3
after "deploy:restart", "deploy:cleanup"