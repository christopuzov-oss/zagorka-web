# config valid only for current version of Capistrano
lock "3.8.0"

set :application, "zagorkacompany"
set :repo_url,  "ssh://git@git.elevatecompany.eu:2222/dev/zagorkacompany.git"

set :branch, ENV['branch'] || 'master'

set :linked_files, fetch(:linked_files, []).push('config/unicorn.rb',
                                                 'db/production.sqlite3',
                                                 'db/staging.sqlite3',
                                                 'config/master.key')
set :linked_dirs, %w(log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/uploads public/ckeditor_assets)

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do
  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end
  after :restart, 'deploy:nondigest'
end