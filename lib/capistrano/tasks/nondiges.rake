namespace :deploy do
  desc 'Create nondigest versions of error pages'
  task nondigest: [:set_rails_env] do
    on release_roles([:app]) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, 'error_pages:nondigest'
        end
      end
    end
  end
end
