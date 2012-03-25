set :application, "thebergestonewedding.com"
set :repository,  "git@github.com:Encryptic/Wedding-Website.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "thebergestonewedding.com"                          # Your HTTP server, Apache/etc
role :app, "thebergestonewedding.com"                          # This may be the same as your `Web` server
role :db,  "localhost", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

set :user, 'wedding'
set :use_sudo, false
set :deploy_to, "/home/wedding/weddingsite"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

# Example From: https://gist.github.com/308763
# http://github.com/thoughtbot/suspenders/blob/4d9c29a1dfe14a591ac461d5ea8e660f1a642d5b/config/deploy.rb#L40
namespace :db do
  desc "Create database password in shared path" 
  task :password do
    set :db_password, Proc.new { Capistrano::CLI.password_prompt("Remote database password: ") }
    run "mkdir -p #{shared_path}/config" 
    put db_password, "#{shared_path}/config/dbpassword" 
  end
end