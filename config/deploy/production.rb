role :app, %w[new.zagorkacompany.bg]
role :web, %w[new.zagorkacompany.bg]
role :db,  %w[new.zagorkacompany.bg]
set :deploy_to, '/home/zagorkacompany/heinekenzagorkabrewery.bg'
set :rvm_ruby_version, IO.read('.ruby-version')
set :rbenv_type, :user
server 'new.zagorkacompany.bg', roles: %w[web app], ssh_options: { user: 'zagorkacompany', port: 22 } # , my_property: :my_value

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute '/home/zagorkacompany/rc.d/rc.unicorn-heinekenzagorkabrewery.bg restart'
    end
  end
end