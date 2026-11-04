role :app, %w[zagorkacompany.stage.elevatecompany.eu]
role :web, %w[zagorkacompany.stage.elevatecompany.eu]
role :db,  %w[zagorkacompany.stage.elevatecompany.eu]
set :deploy_to, '/home/stage/zagorkacompany'
set :rvm_ruby_version, IO.read('.ruby-version')
set :rbenv_type, :user
server 'zagorkacompany.stage.elevatecompany.eu', roles: %w[web app], ssh_options: { user: 'stage', port: 2222 } # , my_property: :my_value

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute '/home/stage/rc.d/rc.unicorn-zagorkacompany restart'
    end
  end
end