set :application, 'peddie_communityservice'
set :repo_url, 'https://github.com/jiehanzheng/peddie_communityservice.git'
set :branch, 'master'

set :deploy_to, '/home/webapp/peddie_communityservice'
set :scm, :git

set :rvm1_ruby_version, '2.0.0'

set :format, :pretty

set :linked_files, %w{config/database.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

set :keep_releases, 5

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :finishing, 'deploy:cleanup'

end
