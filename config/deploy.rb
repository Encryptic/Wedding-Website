set :application, "thebergestonewedding.com"
set :repository,  "git@github.com:Encryptic/Wedding-Website.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "direct.thebergestonewedding.com"                          # Your HTTP server, Apache/etc
role :app, "direct.thebergestonewedding.com"                          # This may be the same as your `Web` server
role :db,  "direct.thebergestonewedding.com", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

set :user, 'wedding'
set :use_sudo, false
set :deploy_to, "/home/wedding/weddingsite"
set :htaccess, "#{release_path}/public/.htaccess"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

set :keep_releases, 4

before "db:migrate", "deploy:bundle_gems"
before "db:migrate", "db:create_symlink"
before "deploy:restart", "db:migrate"
after "deploy", "deploy:restart"
after "deploy:update", "deploy:cleanup" 

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :bundle_gems do
    run "cd #{release_path} && bundle config build.libv8 --with-system-v8 && bundle install --path vendor/bundle --without=test development"
  end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "rm -rf ~/public_html; ln -s #{release_path}/public ~/public_html"
    run "ln -nfs #{shared_path}/public/.htaccess #{htaccess}"
    run "touch #{release_path}/tmp/restart.txt"
    run "cd #{release_path}; bundle exec rake assets:precompile"
  end
end

# Example From: https://gist.github.com/308763
# http://github.com/thoughtbot/suspenders/blob/4d9c29a1dfe14a591ac461d5ea8e660f1a642d5b/config/deploy.rb#L40
namespace :db do
  task :create_symlink do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    run "ln -nfs #{shared_path}/config/email.yml #{release_path}/config/email.yml"
    run "ln -nfs #{shared_path}/config/newrelic.yml #{release_path}/config/newrelic.yml"
    run "ln -nfs #{shared_path}/public/uploads #{release_path}/public/uploads"
  end
  task :migrate do
    run "cd #{release_path}; bundle exec rake db:migrate --trace RAILS_ENV='production'"
  end
  # call cap db:password the first time you deploy to a server.
  desc "Create database password in shared path" 
  task :password do
    set :db_password, Proc.new { Capistrano::CLI.password_prompt("Remote database password: ") }
    run "mkdir -p #{shared_path}/config" 
    put db_password, "#{shared_path}/config/dbpassword" 
  end
end