require "bundler/capistrano"

load 'deploy/assets'

set :bundle_flags, "--deployment --quiet --binstubs --shebang ruby-local-exec --without development test"
set :application, "gradeual"
set :default_environment, {
  'PATH' => '/usr/local/rbenv/bin:/usr/local/rbenv/shims:$PATH'
}
set :repository,  "."
# set :deploy_via, :copy
set :deploy_via, :checkout
set :copy_strategy, :export
set :rails_env, :production
# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

after "deploy:update_code", "deploy:migrate"

set :scm, "git"
set :repository, "https://github.com/danielevans/gradeual.git"
set :branch, "dev"

set :deploy_to, "/srv/gradeual"

role :web, "gradeual.com"                          # Your HTTP server, Apache/etc
role :app, "gradeual.com"                          # This may be the same as your `Web` server
role :db,  "gradeual.com", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"



# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end


namespace :foreman do
  desc "Export the Procfile to Ubuntu's upstart scripts"
  task :export, :roles => :app do
    foreman_env_vars = <<-ENV
RAILS_ENV=#{rails_env}
ENV
    put foreman_env_vars, "#{release_path}/.env"
    run "cd #{release_path}; sudo -i #{release_path}/bin/foreman export upstart -e #{release_path}/.env -f #{release_path}/Procfile /etc/init -a gradeual -u ubuntu -l log/gradeual"
  end

  desc "Start the application services"
  task :start, :roles => :app do
    sudo "start gradeual"
  end

  desc "Stop the application services"
  task :stop, :roles => :app do
    sudo "stop gradeual"
  end

  desc "Restart the application services"
  task :restart, :roles => :app do
    run "sudo start gradeual || sudo restart gradeual"
  end
end

after "deploy:update", "foreman:export"
after "deploy:update", "foreman:restart"
