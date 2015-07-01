worker_processes Integer(ENV["WEB_CONCURRENCY"] || 2)
timeout (ENV['RAILS_ENV'] == 'development' || ENV['RAILS_ENV'].nil? ? 3600 : 60)
preload_app true

before_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  ActiveRecord::Base.connection.disconnect! if defined?(ActiveRecord::Base)
end

after_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end

  ActiveRecord::Base.establish_connection if defined?(ActiveRecord::Base)
end
