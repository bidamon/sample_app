workers Integer(ENV['WEB_CONCURRENCY'] || 2)
threads_count = Interger(ENV['MAX_THREADS'] || 5)
threads threads_count, threads_count


preload_app!



rackup        DefaultRackup
port          ENV['PORT'] || 3000
environment   ENV['RACK_ENV'] || 'development'


on_worker_boot do
  #worker specific setup for rails 4.1+
  #See: https://devcenter.heroku.com/articles
  #deploying-rails-applications-with-the-puma-web-server#on-worker-boot
  ActiveRecord::Base.establish_connection
end