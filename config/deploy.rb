set :application, 'peddie_communityservice'
set :repo_url, 'https://github.com/jiehanzheng/peddie_communityservice.git'
set :branch, 'master'

set :deploy_to, '/home/webapp/peddie_communityservice'
set :scm, :git

set :rvm1_ruby_version, '2.0.0'

set :format, :pretty

set :linked_files, %w{config/database.yml config/initializers/secret_token.rb}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

set :keep_releases, 5

namespace :deploy do

  desc 'Start application'
  task :start do
    on roles(:app), in: :sequence, wait: 5 do
      execute '/usr/lib/passenger/bin/passenger', 'start', '-a', '127.0.0.1', '-p', '12131', '-e', 'production', '-d', release_path
    end
  end

  desc 'Stop application'
  task :stop do
    on roles(:app), in: :sequence, wait: 5 do
      execute '/usr/lib/passenger/bin/passenger', 'stop', '-p', '12131', release_path
    end
  end

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :finishing, 'deploy:cleanup'

end
